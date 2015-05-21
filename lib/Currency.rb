class DifferentCurrencyCodeError < StandardError
end

class Currency
  attr_accessor :value, :code

  def initialize(value, code)
      @value = value
      @code = code
  end

  def == (other)
    other.is_a?(Currency) && other.value == value && other.code == code
  end

  def + (other)
    if other.is_a?(Currency) && other.code == code
      @value += other.value
    else
      raise DifferentCurrencyCodeError
    end
  end

  def - (other)
    if other.is_a?(Currency) && other.code == code
      @value -= other.value
    end
  end
end
