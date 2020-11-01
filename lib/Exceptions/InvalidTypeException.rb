class InvalidTypeException < RuntimeError

  def initialize(expected_type, received_type)
    super(message(expected_type, received_type))
  end

  private

  def message(expected_type, received_type)
    "Required #{expected_type} but was #{received_type}"
  end
end
