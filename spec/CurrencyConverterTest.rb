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

  def test_can_convert_multiple_currencies
    currency_converter = CurrencyConverter.new({:USD => 1, :EUR => 0.9, :GBP => 0.65, :INR => 63.48})
    us_currency = Currency.new(10, :USD)
    eur_currency = Currency.new(10, :EUR)
    gbp_currency = Currency.new(10, :GBP)
    inr_currency = Currency.new(10, :INR)
    us_to_eur = currency_converter.make_exchange(us_currency, :EUR)
    eur_to_gbp = currency_converter.make_exchange(eur_currency, :GBP)
    gbp_to_inr = currency_converter.make_exchange(gbp_currency, :INR)
    inr_to_us = currency_converter.make_exchange(inr_currency, :USD)
    assert_equal(Currency.new(9,:EUR), us_to_eur)
    assert_equal(Currency.new(7.22, :GBP), eur_to_gbp)
    assert_equal(Currency.new(976.62, :INR), gbp_to_inr)
    assert_equal(Currency.new(0.16, :USD), inr_to_us)
  end

  def test_raise_unknown_currency_error
    currency_converter = CurrencyConverter.new({:USD => 1, :EUR => 0.9})
    us_currency = Currency.new(10, :USD)
    assert_raises(*UnknownCurrencyCodeError) { currency_converter.make_exchange(us_currency, :INR)}
  end

end

