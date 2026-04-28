
require 'minitest/autorun'

class DiameterDouble
  def width
    10
  end
end

module DiameterizableInterfaceTest
  def test_implements_the_diameterizable_instance
    assert_respond_to(@object, :width)
  end
end

# 該当の test double がこのテストが期待するインターフェースを守ることを証明する
class DiamerterDoubleTest < Minitest::Test
  include DiameterizableInterfaceTest

  def setup
    @object = DiameterDouble.new
  end
end

class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def width # 以前はdiameterだった
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end
end

class Gear
  attr_reader :chainring, :cog, :wheel, :observer

  def initialize(args)
    @chainring = args[:chainring]
    @cog = args[:cog]
    @wheel = args[:wheel]
    @observer = args[:observer]
  end

  def defaults
    {:chainring => 40, :cog => 18}
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * wheel.width
  end

  def set_cog(new_cog)
    @cog = new_cog
    changed
  end

  def set_chainring(new_chainring)
    @chainring = new_chainring
    changed
  end

  def changed
    observer.changed(chainring, cog)
  end
end

class GearTest < Minitest::Test
  def test_calculates_gear_inches
    gear = Gear.new(
      chainring: 52,
      cog: 11,
      wheel: DiameterDouble.new
    )

    assert_in_delta(47.27, gear.gear_inches, 0.01)
  end
end

class WheelTest < Minitest::Test
  include DiameterizableInterfaceTest

  def setup
    @wheel = @object = Wheel.new(26, 1.5)
  end

  def test_calculates_diameter
    wheel = Wheel.new(26, 1.5)

    assert_in_delta(29, wheel.width, 0.01)
  end
end
