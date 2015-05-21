require 'minitest/autorun'

require_relative '../lib/currency.rb'

class CurrencyTest < Minitest::Test
  def test_currency_exists
    assert(Currency)
  end

  def test_currency_has_value_and_code
    ten_dollars = Currency.new("10", "USD")
    assert_equal("10", ten_dollars.value)
    assert_equal("USD", ten_dollars.code)
  end


end
