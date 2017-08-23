require 'httparty'
require 'clipboard'

module Script
  class Token
    
    attr_reader :token, :expiration_time, :type
    
    FLEX = :flex.freeze
    
    class << self
      
      def get(type)
        case type
        when FLEX
          Token.new(get_flex_token, Time.now + 3600, type)
        end
      end
      
      def get_flex_token
        headers = {
          'Accept' => 'text/html'
        }

        HTTParty.get(
          "https://services.development.carecloud.com/login?login=#{ENV['CC_LOGIN']}&password=#{ENV['CC_PASSWORD']}",
          headers: headers
        ).parsed_response
      end
      
    end
    
    
    def initialize(token, expiration_time, type)
      @token = token
      @expiration_time = expiration_time
      @type = type
    end
    
    def expired?
      Time.now > @expiration_time
    end
    
    def live?
      !expired?
    end
    
    def formatted_expiration_time
      if expiration_time.to_date == Date.today
        expiration_time.strftime("%l:%M")
      else
        expiration_time.strftime("%l:%M %R").gsub('-', '/')
      end
    end
    
    def message
      "Token good until #{formatted_expiration_time}".gsub("  ", ' ')
    end
    
    def copy
      Clipboard.copy(token)
    end
    
    def write_to_file(path=nil)
      case type
      when FLEX
        FileWriter.write_flex_token(token, path)
      end
    end
    
  end
end