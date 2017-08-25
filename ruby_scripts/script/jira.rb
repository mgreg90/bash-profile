module Script
  class Jira
    
    JIRA_URL = ENV['JIRA_URL'].freeze
    
    def initialize
      if File.exists?('.git')
        @branch = git branch no_print: true, current_branch: true # this comes from git_pry.rb
      end
    end
    def launch
      if JIRA_URL && @branch
        if ['master', 'develop'].include?(@branch)
          `open #{JIRA_URL}`
          JIRA_URL
        else
          puts "Launching Jira in your default browser..."
          `open #{JIRA_URL}browse/#{@branch}`
          "#{JIRA_URL}browse/#{@branch}"
        end
      else
        puts "You need a JIRA_URL in your environment variables." if !JIRA_URL
        puts "There's something wrong with git. Are you sure you're in a directory with git init'd?" if !@branch
      end
    end
  end
end