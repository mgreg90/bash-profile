def handle_error(message, error)
  puts '-' * 50
  puts message
  p error
  puts '-' * 50
end


begin
  require "wirble"
  Wirble.init
  Wirble.colorize
  puts "Wirble loaded successfully!"
rescue LoadError => e
  handle_error("Wirble failed to load!", e)
end

begin
  require "awesome_print"
  puts "Awesome Print loaded successfully!"
rescue LoadError => e
  handle_error("Awesome Print failed to load!", e)
end
  
begin
  require "terminfo"
  require "curses"
  require '~/src/git-ruby/git.rb'
  
  def gst; git status; end
  def gd; git diff; end
  def glg; git log; end
  puts "Git loaded successfully!"
rescue LoadError => e
  handle_error("Git Failed to load!", e)
end

begin
  require_relative 'script'
  puts 'Your Ruby Scripts loaded successfully!'
rescue LoadError => e
  handle_error('Your Ruby Scripts failed to load!', e)
end

Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 's', 'step'
Pry.commands.alias_command 'n', 'next'
Pry.commands.alias_command 'w', 'whereami'


# Aliases


# End Aliases