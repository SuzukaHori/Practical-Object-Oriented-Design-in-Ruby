class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(args)
    @chainring = args[:chainring]
    @cog = args[:cog]
    @wheel = args[:wheel]
  end

  def defaults
    {:chainring => 40, :cog => 18}
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end
end


class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    # binding.irb
    @rim = rim
    @tire = tire
  end

  def diameter
    # タイヤはリムの周りを囲むので、直径を計算するためには2倍する
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end
end
