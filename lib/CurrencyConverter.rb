require_relative "currency.rb"

class UnknownCurrencyCodeError < StandardError
end

class CurrencyConverter
  attr_accessor :exchange_rates, :exchanged_currency

  def initialize(hash)
    @exchange_rates = hash
  end

  def exchange_maths(old_rate, requested_rate)
    @new_rate = requested_rate / old_rate
  end

  def make_exchange(old_currency, requested_currency)
    @exchanged_currency = Currency.new(nil,requested_currency)
    @exchange_rates.each do |key, value|
      if key == requested_currency
        @requested_rate = value
      end
      if key == old_currency.code
        @old_rate = value
      end
      if @exchange_rates.has_key?(requested_currency) == false
        raise UnknownCurrencyCodeError
      end
    end
    exchange_maths(@old_rate, @requested_rate)
    @exchanged_currency.value = @new_rate * old_currency.value
    @exchanged_currency.value = @exchanged_currency.value.round(2)
    @exchanged_currency
  end
end
