module Validator
  def valid?
    begin
      validate!
    rescue ArgumentError
      false
    else
      true
    end
  end
end
