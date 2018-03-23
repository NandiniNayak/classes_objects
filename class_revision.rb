class Car
  attr_accessor :model , :car_count
  attr_writer :make
  attr_reader :color

  def initialize
    @car_count++
  end

end
