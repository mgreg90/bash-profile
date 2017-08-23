require_relative 'terminal_utils'
module Script
  class TerminalDisplay
    
    include TerminalUtils
    
    BORDER_OFFSET = 2
    
    def initialize(message, options={})
      # message can be a string or an array
      @message = (message.to_s == message ? message.chomp.split("\n") : message)
      @display_seconds = options[:display_seconds]
      @border_character = options[:border] || '*'
      @text_align = options[:text_align] || :left
      @clear_after_display = options[:clear_after_display]
      @preferred_height = options[:height]
    end
    
    # is there a border?
    def border?
      !!@border_character
    end
    
    # builds a full width border
    def border
      buffer = screen_width % @border_character.length
      border_length = (screen_width / @border_character.length)
      @border_character * (border_length + buffer)
    end
    
    # prints the message using the full terminal window
    # also waits for the given time
    def display
      wrap_in_border do
        print_space(:before)
        puts formatted_message
        print_space(:after)
      end
      sleep @display_seconds if !@display_seconds.nil?
      clear if @clear_after_display
      @message
    end
    
    # aligns message text horizontally
    def formatted_message
      case @text_align
      when :center
        align_center
      when :left
        @message
      when :right
        align_right
      end
    end
    
    # aligns message text to the horizontal center
    def align_center
      @message.map do |msg_line|
        blank_space = horizontal_blank_space(msg_line) + 1
        " " * (blank_space / 2) + msg_line
      end
    end
    
    # aligns message text to the right
    def align_right
      @message.map do |msg_line|
        blank_space = horizontal_blank_space(msg_line)
        " " * (blank_space) + msg_line
      end
    end
    
    def height
      if @preferred_height && @preferred_height <= (@message.length + BORDER_OFFSET)
        @message.length + BORDER_OFFSET
      elsif @preferred_height && @preferred_height <= screen_height
        @preferred_height
      else
        screen_height
      end
    end
    
    # calculates how much space will be blank on a given line
    def horizontal_blank_space(msg_line="")
      screen_width - msg_line.length
    end
    
    # calculates how much space will be blank vertically
    def vertical_blank_space
      border_penalty = border? ? 2 : 4
      border_penalty += 2 if @display_seconds.nil? # this is for display and stop running
      vbs = height - border_penalty - @message.length
      vbs > 0 ? vbs : 0
    end
    
    # prints the empty lines about and bellow the message
    def print_space(location_relative_to_msg)
      odd_height_correction = 
        (vertical_blank_space.odd? && location_relative_to_msg == :after ? 1 : 0)
      puts "\n" * ((vertical_blank_space / 2) + odd_height_correction)
    end
    
    # wraps the message in the border
    def wrap_in_border
      puts border if border?
      yield
      print border if border?
    end
              
  end
end