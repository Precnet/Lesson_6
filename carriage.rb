require_relative 'validator.rb'

# Carriage
class Carriage
  include Manufacturer
  include Validator

  NUMBER_LENGTH = 5
  BASE_36 = 36
  CARRIAGE_TYPE = ''.freeze

  attr_reader :number, :type

  def initialize(carriage_number)
    @number = carriage_number
    validate!
  end

  protected

  def validate!
    type_message = "Wrong carriage name! Should be string, got #{@number.class}"
    raise ArgumentError, type_message unless @number.is_a?(String)
    length_message = "Carriage number should be between 3 and 20 symbols! Got - #{@number.length}"
    raise ArgumentError, length_message unless 3 < @number.length && @number.length < 20
  end

  # this is a method for creating default name for carriage it should not
  # be used outside of object constructor
  def generate_carriage_number(number_length)
    CARRIAGE_TYPE + '_' + rand(BASE_36**number_length).to_s(BASE_36)
  end
end
