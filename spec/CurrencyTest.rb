require 'minitest/autorun'

require_relative '../lib/currency.rb'

class CurrencyTest < Minitest::Test
  def test_currency_exists
    assert(Currency)
  end

  def test_currency_has_value_and_code
    ten_dollars = Currency.new(10, :USD)
    assert_equal(10, ten_dollars.value)
    assert_equal(:USD, ten_dollars.code)
  end

  def test_currency_object_should_equal_currency_object_with_same_value
    test1 = Currency.new(10, :USD)
    test2 = Currency.new(10, :USD)
    assert_equal(true, test1 == test2)
  end

  def test_currency_object_should_not_equal_currency_object_with_different_value
    test1 = Currency.new(10, :USD)
    test2 = Currency.new(20, :USD)
    assert_equal(false, test1 == test2)
  end

  def test_adding_currency_objects_with_same_currency_code
    test1 = Currency.new(10, :USD)
    test2 = Currency.new(20, :USD)
    assert_equal(30, test1 + test2)
  end

  def test_subtracting_currency_objects_with_same_currency_code
    test1 = Currency.new(10, :USD)
    test2 = Currency.new(20, :USD)
    assert_equal(10, test2 - test1)
  end

  def test_cannot_add_or_subtract_different_currency_codes_together
    test1 = Currency.new(10, :USD)
    test2 = Currency.new(10, :EUR)
    assert_raises(*DifferentCurrencyCodeError) { test1 + test2 }
    assert_raises(*DifferentCurrencyCodeError) { test1 - test2 }
  end

  def test_can_multiply_by_fixnums_and_floats
    test1 = Currency.new(10, :USD)
    test2 = Currency.new(20, :USD)
    assert_equal(50, test1 * 5)
    assert_equal(40, test2 * 2)
  end

  def test_cannot_multiply_by_non_numbers
    test1 = Currency.new(10, :USD)
    assert_raises(*CanOnlyMultiplyByNumberError) { test1 * "string" }
    assert_raises(*CanOnlyMultiplyByNumberError) { test1 * [1, 2, 3] }
  end

end
