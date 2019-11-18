# frozen_string_literal: true

# Route
require_relative 'instance_counter.rb'
require_relative 'validator.rb'

# Route
class Route
  include InstanceCounter
  include Validator

  attr_reader :stations, :number

  def initialize(first_station, last_station, number = generate_route_number(5))
    @stations = [first_station, last_station]
    @number = number
    validate!
    register_instance
  end

  def add_station(new_station)
    # check for duplication
    duplicate_message = 'Can`t add duplicate stations to the route!'
    raise ArgumentError, duplicate_message if @stations.find_index(new_station)
    @stations.insert(-2, new_station)
  end

  def delete_station(station)
    message = "There is no station #{station} in current route!"
    raise ArgumentError, message unless @stations.include? station

    @stations.delete_at(@stations.find_index(station))
  end

  private

  def validate!
    # empty method, added according to task requirement.
    # has no actual code because of:
    # 1) there are no requirements to route number
    # 2) to avoid duplication with storing actual station objects route saves only station`s names,
    # while actual stations are stored in instances of UserData class (main.rb)
  end

  def generate_route_number(number_length)
    rand(36**number_length).to_s(36)
  end
end
