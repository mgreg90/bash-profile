require 'httparty'
require_relative 'terminal_utils'
require_relative 'terminal_display'
require_relative 'bitcoin/service'

module Script
  class Bitcoin

    include Script::TerminalUtils

    DEFAULT_COINS = ['BTC', 'ETH', 'LTC']
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
      fresh_prices = fresh_prices.map do |coin, price|
        "Current Coinbase #{COIN_MAP[coin][:name]} Price: $#{price}"
      end
      fresh_prices << "Last Fetched At: #{@last_fetch.strftime('%x %r')}"
    end

    # Get prices from cryptocompare API
    def get_prices
      @coins.map do |coin|
        @last_fetch = Time.now
        [coin, Service.new(coin).get_prices["USD"]]
      end.to_h
    end

  end
end