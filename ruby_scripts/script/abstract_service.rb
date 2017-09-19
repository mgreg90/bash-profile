require 'httparty'

module Script
  class AbstractService
    
    DEFAULT_ERROR_MESSAGE = "Request Failed!"

    def get
      HTTParty.get("#{url}?#{query_string}").parsed_response
    rescue => e
      TerminalDisplay.new(error_message || DEFAULT_ERROR_MESSAGE, border: '!', text_align: :center, height: 20).display
      abort
    end

    def url
      raise "You need to define a method 'url' to use AbstractService"
    end

    def set_url(new_url)
      @url = new_url
    end

    def query_string
      raise "You need to define a method 'url' to use AbstractService"
    end

    def set_query_string(query_params)
      @query_string = query_params.to_query_string
    end
    
    def error_message
      @error_message
    end
    
    def set_error_message(error_message)
      @error_message = error_message
    end

  end
end