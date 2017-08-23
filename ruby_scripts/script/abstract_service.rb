require 'httparty'

module Script
  class AbstractService

    def get
      HTTParty.get("#{url}?#{query_string}").parsed_response
    rescue => e
      err_msg = "Request for prices failed! Are you connected to the internet?"
      TerminalDisplay.new(err_msg, border: '!', text_align: :center, height: 20).display
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

  end
end