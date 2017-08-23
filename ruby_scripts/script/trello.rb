require 'pry'

module Script
  class Trello
    def initialize
      @path = `pwd`.chomp
    end
    
    def launch
      file_path = "#{@path}/.trello"
      if File.file?(file_path)
        trello_url = File.open("#{@path}/.trello", &:readline)
        puts "Launching Trello in your default browser..."
        `open #{trello_url}`
      else
        puts "Launch Failed! There's no .trello file here!"
      end
    end
  end
end