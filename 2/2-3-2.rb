class Gear
  attr_reader :chainring, :cog

  def initialize(chainring, cog)
    @chainring = chainring
    @cog = cog
  end

  # attr_readerによるデフォルトの実装
  # def cog
  #   @cog
  # end

  def ratio
    chainring / cog.to_f # <= 破滅への道
  end
end

gear = Gear.new(1, 2)
puts gear.ratio
puts gear.chainring
puts gear.cog
