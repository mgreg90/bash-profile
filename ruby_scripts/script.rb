Dir["#{File.dirname(__FILE__)}/script/**/*.rb"].each { |file| require file }
require_relative 'git_pry'

module Script

  def self.prices(argv)
    Bitcoin.new(argv).prices
  end

  def self.repeating_prices(argv)
    Bitcoin.new(argv).repeating_prices
  end
  
  def self.trello(argv)
    Trello.new.launch
  end
  
  def self.jira(argv)
    Jira.new.launch
  end
  
  def self.github(argv)
    Github.new.launch
  end

end

Dir["#{File.dirname(__FILE__)}/secret_ruby_scripts/**/*.rb"].each { |file| require file }

if ARGV.empty?
  puts "Either you didn't give a valid script, or your just regular ol' starting pry"
else
  Script.send(ARGV[0].downcase, ARGV[1..-1])
end