require "minitest/autorun"

require_relative "../lib/currencyconverter.rb"

class CurrencyConverterTest < Minitest::Test

  def test_currency_converter_exists
    assert(CurrencyConverter)
  end

  def test_currency_converter_has_hash
    hash = {
      :USD => 1,
      :EUR => 0.90
    }
    result = CurrencyConverter.new(hash)
    assert(result.exchange_rates)
  end

  def test_can_convert_currency
    old_currency = Currency.new(10, :USD)
    currency_converter = CurrencyConverter.new({:USD => 1, :EUR => 0.90})
    exchanged_currency = currency_converter.make_exchange(old_currency, :EUR)
    assert_equal(exchanged_currency, Currency.new(9.0, :EUR))
  end

end

