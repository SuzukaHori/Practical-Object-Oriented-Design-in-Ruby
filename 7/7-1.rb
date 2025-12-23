class Schedule
  def scheduled?(schedulable, start_date, end_date)
    puts "This #{schedulable.class}" + "is not scheduled\n" + " between #{start_date} and #{end_date}"
    false
  end
end

class Bicycle
  attr_reader :schedule, :size, :chain, :tire_size

  def initialize(args={})
    @schedule = args[:schedule] || Schedule.new
    @size = args[:size]
    @chain = args[:chain]
    @tire_size = args[:tire_size]
  end

  def schedulable?(start_date, end_date)
    !scheduled?(start_date - lead_days, end_date)
  end

  def scheduled?(start_date, end_date)
    schedule.scheduled?(self, start_date, end_date)
  end

  def lead_days
    1
  end
end

require "date"
starting = Date.parse("2015/9/04")
ending = Date.parse("2015/9/04")

b = Bicycle.new
p b.schedulable?(starting, ending)
