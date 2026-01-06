module Schedulable
  attr_writer :schedule

  def schedule
    @schedule ||= ::Schedule.new
  end

  def schedulable?(start_date, end_date)
    !scheduled?(start_date - lead_days, end_date)
  end

  def scheduled?(start_date, end_date)
    schedule.scheduled?(self, start_date, end_date)
  end

  def lead_days
    0
  end
end

class Schedule
  def scheduled?(schedulable, start_date, end_date)
    puts "This #{schedulable.class}" + "is not scheduled\n" + " between #{start_date} and #{end_date}"
    false
  end
end

class Bicycle
  include Schedulable

  def lead_days
    1
  end
end

class Vehcle
  include Schedulable

  def lead_days
    3
  end
end

class Mechanic
  include Schedulable

  def lead_days
    4
  end
end

require "date"
starting = Date.parse("2015/9/04")
ending = Date.parse("2015/9/10")

b = Bicycle.new
p b.schedulable?(starting, ending)

v = Vehcle.new
p v.schedulable?(starting, ending)

m = Mechanic.new
p m.schedulable?(starting, ending)
