require 'minitest/autorun'

require_relative '../lib/currency.rb'

class CurrencyTest < Minitest::Test
  def test_currency_exists
    assert(Currency)
  end

  def test_currency_has_value_and_code
    ten_dollars = Currency.new("10", "USD")
    assert_equal("10", ten_dollars.currency_object[:value])
    assert_equal("USD", ten_dollars.currency_object[:code])
  end

def test_currency_should_equal_same_currency
    result1 = Currency.new("10", "USD")
    result2 = Currency.new("10", "USD")
    assert_equal(true, result1.currency_object == result2.currency_object)
  end
end
