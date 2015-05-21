class Currency
  attr_accessor :value, :code

  def initialize(value, code)
      @value = value
      @code = code
  end

  def == (other)
    other.is_a?(Currency) && other.value == self.value && other.code == self.code
  end
end
