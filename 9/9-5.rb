require 'minitest/autorun'
require_relative '/Users/suzuka/Practical-Object-Oriented-Design-in-Ruby/5/5-2-1.rb'

module PreparerInterfaceTest
  def test_implements_the_preparer_interface
    assert_respond_to(@object, :prepare_trip)
  end
end

class MechanicTest < Minitest::Test
  include PreparerInterfaceTest

  def setup
    @mechanic = @object = Mechanic.new
  end

  # mechanic に依存する他のテスト
end

class TripCoordinatorTest < Minitest::Test
  include PreparerInterfaceTest

  def setup
    @trip_coordinator = @object = TripCoordinator.new
  end
end

class DriverTest < Minitest::Test
  include PreparerInterfaceTest

  def setup
    @driver = @object = Driver.new
  end
end
