require 'minitest/autorun'

require_relative '../lib/currencyconverter.rb'

class CurrencyConverterTest < Minitest::Test

  def test_currency_converter_exists
    assert(CurrencyConverter)
  end

end

