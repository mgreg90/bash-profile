class Hash
  def to_query_string
    map { |k, v| "#{k}=#{v}"}.join('&')
  end
end

class Float
  def to_money
    "$#{sprintf("%.2f", self).to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse}"
  end
end