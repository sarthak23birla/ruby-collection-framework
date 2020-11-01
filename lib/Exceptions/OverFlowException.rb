class OverFlowException < RuntimeError
  def initialize(capacity)
    super(message(capacity))
  end

  private

  def message(capacity)
    "Overflowed! The Specified Cacpacity is: #{capacity}"
  end
end
