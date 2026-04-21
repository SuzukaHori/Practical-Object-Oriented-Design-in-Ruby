require 'minitest/autorun'
require_relative '/Users/suzuka/Practical-Object-Oriented-Design-in-Ruby/5/5-2-1.rb'

class TripTest < Minitest::Test
  def test_requests_trip_preparation
    @preparer = Minitest::Mock.new
    @trip = Trip.new
    @preparer.expect(:prepare_trip, nil, [@trip])

    @trip.prepare([@preparer])
    @preparer.verify
  end
end
