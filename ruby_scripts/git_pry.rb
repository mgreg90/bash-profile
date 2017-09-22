require '~/src/bash-profile/ruby_scripts/script/terminal_utils.rb'

module Git
  CURRENT_BRANCH_REGEX = /\*\s?(?<branch>\S*)/i
  ENTER = "\n".freeze
  SPACE = " \n".freeze
  Q = /q/i
  
  def self.status
    puts `git status`
  end
  
  def self.add(args=[])
    puts `git add #{args.any? ? args.join(' ') : '.'}`
    status
  end
  
  def self.commit(message)
    puts `git commit -m "#{message}"`
  end
  
  def self.diff
    diff = `git diff`.split(ENTER)
    less(diff)
  end
  
  def self.log
    logs = `git log`.split(ENTER)
    less(logs)
  end
  
  def self.reset(commit_hash)
    puts `git reset #{commit_hash}`
  end
  
  def self.remote(options={})
    grv = `git remote -v`
    puts grv unless options[:no_print]
    grv
  end
  
  def self.branch(options={})
    branches = `git branch`
    puts branches unless options[:no_print]
    if options[:current_branch]
      branches.match(CURRENT_BRANCH_REGEX)[:branch]
    else
      branches
    end
  end
  
  def self.less(lines)
    # takes an array of strings
    screen_length = Script::TerminalUtils.screen_length - 1
    last_line = screen_length - 2
    
    while last_line < lines.length
      
      if defined?(first_line)
        first_line = (last_line-screen_length) + 1
      else
        first_line = 0
      end
      puts lines[first_line..last_line]
      print "command: "
      user_input = gets
      
      case user_input
      when ENTER
          last_line += 1
      when SPACE
          last_line += (screen_length - 1)
      when Q
        break
      end
      
    end

  end
  
end

STATUS = 'status'.freeze
ADD = 'add'.freeze
COMMIT = 'commit'.freeze
DIFF = 'diff'.freeze
LOG = 'log'.freeze
RESET = 'reset'.freeze
BRANCH = 'branch'.freeze
REMOTE = 'remote'.freeze

def status
  STATUS
end

def add(files='')
  [ADD, files.split(' ')]
end

def commit(message)
  [COMMIT, message]
end

def diff
  DIFF
end

def log
  LOG
end

def reset(commit_hash=nil)
  commit_hash ? [RESET, commit_hash] : RESET
end

def branch(options={})
  [BRANCH, options]
end

def remote
  REMOTE
end

def git(*command)
  command.flatten!
  
  case command.first
  when STATUS
    Git.status
  when ADD
    command[1] ? Git.add(command[1..-1]) : Git.add
  when COMMIT
    Git.commit command[1]
  when DIFF
    Git.diff
  when LOG
    Git.log
  when RESET
    command[1] ? Git.reset(command[1]) : Git.reset
  when BRANCH
    command[1] ? Git.branch(command[1]) : Git.branch
  when REMOTE
    command[1] ? Git.remote(command[1]) : Git.remote
  end
  
end
