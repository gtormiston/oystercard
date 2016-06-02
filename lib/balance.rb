class Balance
  MIN_BALANCE = 0

  def initialize
    @current = MIN_BALANCE
  end
  
  def current
    @current
  end

  def add(value)
    fail "Invalid input" unless add_error?(value)
    @current += value
  end

  def add_error?(value)
    value.respond_to?(:even?)
  end
end
