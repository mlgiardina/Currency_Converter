require_relative "currency.rb"

class CurrencyConverter
  attr_accessor :exchange_rates, :exchanged_currency

  def initialize(hash)
    @exchange_rates = hash
  end

  def make_exchange(old_currency, requested_currency)
    @exchanged_currency = Currency.new("",requested_currency)
    @exchange_rates.each do |key, value|
      if key == requested_currency
      @exchanged_currency.value = old_currency.value * value
      end
    end
    @exchanged_currency
  end
end
