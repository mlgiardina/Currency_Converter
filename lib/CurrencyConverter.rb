class CurrencyConverter
  attr_accessor :exchange_rates

  def initialize(hash)
    @exchange_rates = hash
  end
end
