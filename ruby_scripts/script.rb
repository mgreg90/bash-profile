require_relative 'script/bitcoin'
require_relative 'script/file_writer'
require_relative 'script/terminal_display'
require_relative 'script/terminal_utils'
require_relative 'script/timer'
require_relative 'script/token'

module Script
  
  def self.repeating_token
    @new_token = Token.get_flex
    Timer.new(@new_token.message, 5, action: '@new_token = Token.get_flex', display: true)
  end
  
  def self.prices(argv)
    Bitcoin.new(argv).prices
  end
  
  def self.repeating_prices(argv)
    Bitcoin.new(argv).repeating_prices
  end
  
end

require_relative 'secret_ruby_scripts/coins.rb'

# binding.pry

if ARGV.empty?
  puts "Either you didn't give a valid script, or your just regular ol' starting pry"
else
  Script.send(ARGV[0].downcase, ARGV[1..-1])
end