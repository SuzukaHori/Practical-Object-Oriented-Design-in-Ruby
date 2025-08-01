class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @wheel = Wheel.new(rim, tire)
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end

  Wheel = Struct.new(:rim, :tire) do
    def diameter
      # タイヤはリムの周りを囲むので、直径を計算するためには2倍する
      rim + (tire * 2)
    end
  end
end

puts Gear.new(52, 11, 26, 1.5).gear_inches
puts Gear.new(30, 27, 24, 1.25).gear_inches
