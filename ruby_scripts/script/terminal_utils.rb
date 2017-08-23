require 'terminfo'
require 'curses'
module Script
  module TerminalUtils

      def screen_width
        TermInfo.screen_size[1]
      end

      def screen_height
        TermInfo.screen_size[0]
      end

      def clear
        system 'clear'
      end

      def show_cursor
        Curses.curs_set 1
      end

      def hide_cursor
        Curses.curs_set 0
      end

      def empty_screen
        clear
        hide_cursor
      end

  end
end