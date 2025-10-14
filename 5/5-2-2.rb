# prepare_tripメソッドの追加を強制する

class Trip
  attr_reader :bicycles, :customers, :vehicle

  def prepare(preparers)
    preparers.each {|preparer| preparer.prepare_trip(self) }
  end
end

class Preparer
  def prepare_trip(trip)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class Mechanic < Preparer
  def prepare_trip(trip)
    trip.bicycles.each {|bicycle|
      prepare_bicycles(bicycle)
    }
  end

  def prepare_bicycles(bicycles)
    # ...
  end
end

class TripCoordinator < Preparer
  def prepare_trip(trip)
    buy_food(trip.customers)
  end

  def buy_food(customers)
    # ...
  end
end

class Driver < Preparer
  def prepare_trip(trip)
    vehicle = trip.vehicle
    gas_up(vehicle)
    fill_water_tank(vehicle)
  end

  def gas_up(vehicle)
    # ...
  end

  def fill_water_tank(vehicle)
    # ...
  end
end