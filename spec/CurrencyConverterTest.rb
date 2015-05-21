require 'minitest/autorun'

require_relative '../lib/currencyconverter.rb'

class CurrencyConverterTest < Minitest::Test

  def test_currency_converter_exists
    assert(CurrencyConverter)
  end

  def test_currency_converter_has_hash
    hash = {
      usd: 1,
      eur: 0.90
    }
    result = CurrencyConverter.new(hash)
    assert(result.exchange_rates)
  end

end

