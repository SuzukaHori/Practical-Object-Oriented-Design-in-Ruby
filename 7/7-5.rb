# リスコフの置換原則

class Parent
  def foo
    "foo"
  end
end

class Child < Parent
  attr_accessor :name

  def foo
    1
  end
end

parent = Parent.new
p parent.foo.upcase

child = Child.new
p child.foo.upcase
