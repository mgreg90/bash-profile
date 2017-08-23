module Script
  class Bitcoin
    class Service < Script::AbstractService

      attr_reader :url, :query_string

      API_BASE_URL = "https://api.coinmarketcap.com/"

      def initialize(coin_tickers=[:btc], priced_in_currency=:usd)
        @coin_tickers = coin_tickers.map { |ticker| ticker.to_s.upcase }
        @priced_in_currency = priced_in_currency
      end

      def get_prices
        set_url("#{API_BASE_URL}v1/ticker/")
        set_query_string(
          convert: @priced_in_currency.to_s.upcase
        )
        get.select { |coin| @coin_tickers.include?(coin['symbol'])}
      end

    end
  end
end