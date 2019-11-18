require_relative 'train.rb'

class PassengerTrain < Train
  attr_reader :carriages

  def initialize(train_number)
    super(train_type='passenger', number_of_carriages=0, train_number=train_number)
    @carriages = []
  end

  def add_carriage(carriage)
    raise RuntimeError, 'Can`t add new carriages while train is moving.' unless @current_speed == 0
    error_message = "Wrong carriage for this type of train. Expected 'PassengerCarriage', got #{carriage.class}."
    raise ArgumentError, error_message unless carriage_correct?(carriage)
    carriages.push(carriage)
  end

  def remove_carriage(carriage_number)
    error_message = 'There are no such carriages.'
    raise ArgumentError, error_message unless @carriages.map { |carriage| carriage.number}.include?(carriage_number)
    @carriages.reject! { |carriage| carriage.number == carriage_number }
  end

  def number_of_carriages
    @carriages.length
  end
end
