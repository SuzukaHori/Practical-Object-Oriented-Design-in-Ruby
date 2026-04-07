class DiameterDouble
  def diameter
    10
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
    ratio * wheel.diameter # 古くなっている
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

require 'minitest/autorun'

class GearTest < Minitest::Test
  def setup
    @observer = Minitest::Mock.new
    @gear = Gear.new(
      chainring: 52,
      cog: 11,
      observer: @observer
    )
  end

  def test_notifies_observers_when_cogs_change
    @observer.expect(:changed, true, [52, 27]) # expect(メソッド名, 戻り値, メソッドの引数)
    @gear.set_cog(27)
    @observer.verify
  end

  def test_notifies_observers_when_chainrings_change
    @observer.expect(:changed, true, [42, 11])
    @gear.set_chainring(42)
    @observer.verify
  end
end
