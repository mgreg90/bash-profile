class Hash
  def to_query_string
    map { |k, v| "#{k}=#{v}"}.join('&')
  end
end