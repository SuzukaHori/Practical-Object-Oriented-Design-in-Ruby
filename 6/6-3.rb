class Bicycle
  attr_reader :size, :tape_color

  def initialize(args)
    @size = args[:size]
    @tape_color = args[:tape_color]
  end

  # 全ての自転車は、デフォルト値として
  # 同じタイヤサイズとチェーンサイズを持つ
  def spares
    {chain: '10-speed',
     tire_size: '23',
     tape_color: tape_color}
  end
end

class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock

  def initialize(args)
    @front_shock = args[:front_shock]
    @rear_shock = args[:rear_shock]
    super(args)
  end

  def spares
    super.merge(front_shock: front_shock, rear_shock: rear_shock)
  end
end

# bike = Bicycle.new(size: 'M', tape_color: 'red')
# p bike.size
# p bike.spares

mountain_bike = MountainBike.new(size: 'S', front_shock: 'Manitou', rear_shock: 'Fox')
pp mountain_bike
pp mountain_bike.size
pp mountain_bike.spares