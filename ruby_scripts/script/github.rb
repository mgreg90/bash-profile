module Script
  class Github
    
    GITHUB_URL = 'https://github.com/'
    
    def initialize
      if File.exists?('.git')
        @remotes = parse_remotes(git remote, no_print: true) # this comes from git_pry.rb
      else
        raise "No git remotes!"
      end
    end
    
    def parse_remotes(remotes)
      remotes.split("\n").map do |rem|
        line = rem.split("\t")
        line[0] = line[0].to_sym
        line[1] = line[1].split(' ').first
        line
      end.to_h
    end
    
    def remote_to_url(remote)
      user = remote.split(':')[1].split('/')[0]
      repo = remote.split('/')[1].split('.')[0]
      "#{GITHUB_URL}#{user}/#{repo}"
    end
    
    def launch
      if @remotes.any?
        remote = @remotes[:upstream] || @remotes[:origin]
        url = remote_to_url(remote)
        puts "Launching Github in your default browser..."
        `open #{url}`
        url
      else
        puts "It looks like you haven't set any git remotes!"
      end
    end
  end
end