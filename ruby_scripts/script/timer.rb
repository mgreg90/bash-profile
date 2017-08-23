# IN PROGRESS


require_relative 'terminal_utils'
require 'pry'
module Script
  class Timer
  
    include TerminalUtils
    
    attr_reader :message, :length, :display, :action, :action_type
    
    def initialize message, length=60, options={}
      @message = message
      @length = length
      @display = options[:display] || true
      @action = options[:action]
      @action_type = options[:action_type] || :ruby
    end
    
    def run
      TerminalUtils.clear
      length.times do |remaining_seconds|
        wrap_message { displayed_remaining_time(length - remaining_seconds) } if display
        sleep 1
        TerminalUtils.clear
        end
        # binding.pry
        if action && action_type == :ruby
          eval(action)
        elsif action && action_type == :bash
          `#{action}`
        end
      post_message
    end
    
    private
    
    # helpers
    
    def post_message
      wrap_message(final: true) { "#{message}\n\n" }
    end
    
    def wrap_message(final: false, centered: true, &block)
      puts border
      puts "\n" * ((TerminalUtils.screen_length / 2) - 2)
      print " " * (TerminalUtils.screen_width / 2 - 4)
      puts yield
      puts "\n" * ((TerminalUtils.screen_length / 2) - (final ? 4 : 1))
      print border
    end
    
    def border
      "*" * TerminalUtils.screen_width
    end
    
    def displayed_remaining_time(remaining_seconds)
      (Time.new(0) + remaining_seconds).strftime("%H:%M:%S")
    end
  
  end
end

# Timer.new("hello", 5, action: "sb", display: true).run