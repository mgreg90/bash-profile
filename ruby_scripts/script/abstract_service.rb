module Script
  class AbstractService

    def get
      HTTParty.get("#{url}?#{query_string}").parsed_response
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