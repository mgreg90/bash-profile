module Script
  class Bitcoin
    class Service < Script::AbstractService

      attr_reader :url, :query_string

      API_BASE_URL = "https://min-api.cryptocompare.com/"

      def initialize(coin_ticker=:btc, exchange="Coinbase", priced_in_currency=:usd)
        @coin_ticker = coin_ticker
        @exchange = exchange
        @priced_in_currency = priced_in_currency
      end

      def get_prices
        set_url("#{API_BASE_URL}data/price")
        set_query_string(
          fsym: @coin_ticker.to_s.upcase,
          tsyms: @priced_in_currency.to_s.upcase,
          e: @exchange
        )
        get
      end

    end
  end
end