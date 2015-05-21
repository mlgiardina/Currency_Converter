require 'minitest/autorun'

require_relative '../lib/currency.rb'

class CurrencyTest < Minitest::Test
  def test_currency_exists
    assert(Currency)
  end

  def test_currency_has_value_and_code
    ten_dollars = Currency.new(10, "USD")
    assert_equal(10, ten_dollars.value)
    assert_equal("USD", ten_dollars.code)
  end

  def test_currency_object_should_equal_currency_object_with_same_value
    result1 = Currency.new(10, "USD")
    result2 = Currency.new(10, "USD")
    assert_equal(true, result1 == result2)
  end

  def test_currency_object_should_not_equal_currency_object_with_different_value
    result1 = Currency.new(10, "USD")
    result2 = Currency.new(20, "USD")
    assert_equal(false, result1 == result2)
  end

  def test_adding_currency_objects_with_same_currency_code
    result1 = Currency.new(10, "USD")
    result2 = Currency.new(20, "USD")
    assert_equal(30, result1 + result2)
  end

end
