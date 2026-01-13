module Foo
  def foo_module_method
    p "Foo"
  end
end

module Bar
  def bar_module_method
    p "Bar"
  end
end

module Baz
  def baz_module_method
    p "Baz"
  end
end

class Bicycle
  include Foo

  def bicycle_instance_method
    p "Bicycle"
  end
end

class MountainBike < Bicycle
  include Bar

  def mountain_bike_instance_method
    p "MountainBike"
  end
end

moutain_bike = MountainBike.new
moutain_bike.extend(Baz)
def moutain_bike.mountain_bike_method
  p "mountain_bike"
end

# mountain_bikeの特異メソッド
moutain_bike.mountain_bike_method

# インスタンスをextendしているモジュール群に定義されたメソッド？
moutain_bike.baz_module_method

# MountainBikeクラスに定義されたメソッド
moutain_bike.mountain_bike_instance_method

# MountainBikeクラスにインクルードされたモジュールに定義されたメソッド
moutain_bike.bar_module_method

# Bicycleクラスに定義されたメソッド
moutain_bike.bicycle_instance_method

# Bicycleクラスにインクルードされたモジュールに定義されたメソッド
moutain_bike.foo_module_method

