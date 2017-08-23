require 'awesome_print'
require_relative 'terminal_utils'
require_relative 'terminal_display'
require_relative 'bitcoin/service'

module Script
  class Bitcoin

    include Script::TerminalUtils

    DEFAULT_COINS = ['BTC', 'ETH', 'BCH', 'XRP', 'LTC', 'ETC']
    COIN_MAP = {
      "BTC" => {
        name: 'Bitcoin'
      },
      "ETH" => {
        name: 'Ethereum'
      },
      "LTC" => {
        name: 'Litecoin'
      }
    }
    LOADING_MESSAGE = "Fetching Prices..."
    REPEATING_PRICES_TIMER = 300

    def initialize(*coins)
      @coins = (coins.flatten.empty? ? DEFAULT_COINS : coins.flatten.map(&:upcase))
    end

    def prices(display=true)
      if display
        clear
        Script::TerminalDisplay.new(LOADING_MESSAGE, border: "=", height: 3).display
        Script::TerminalDisplay.new(build_strings, border: "=", height: 15).display
      else
        get_prices
      end
    end

    def repeating_prices
      loop do
        Script::TerminalDisplay.new(LOADING_MESSAGE, border: "=").display
        Script::TerminalDisplay.new(
          build_strings,
          display_seconds: REPEATING_PRICES_TIMER,
          border: "=",
          clear_after_display: true
        ).display
      end
    end

    def build_strings
      fresh_prices = get_prices
      clear
      fresh_prices = fresh_prices.map do |coin|
        # TODO this is super hacky. Fix it.
        first_tab = if coin['name'].length >= 9
          "\t"
        elsif coin['name'].length >= 5
          "\t\t"
        else
          "\t\t\t"
        end
        
        second_tab = coin['price_usd'].to_f.to_money.length < 8 ? "\t\t" : "\t"
        "#{coin['name']} (#{coin['symbol']})#{first_tab} Price: #{coin['price_usd'].to_f.to_money}#{second_tab} Market Cap: #{coin['market_cap_usd'].to_f.to_money}"
      end
      fresh_prices.unshift("According to CoinMarketCap...\n\n")
      fresh_prices << "\nLast Fetched At: #{@last_fetch.strftime('%x %r')}"
    end

    # Get prices from cryptocompare API
    def get_prices
      @last_fetch = Time.now
      Service.new(@coins).get_prices
    end
    
  end
end