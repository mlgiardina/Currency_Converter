class Currency
  attr_accessor :currency_object

  def initialize(value, code)
    @currency_object = {
      value: value,
      code: code
    }
  end

end
