class Period
  def self.current
    convert_to_period(Date.today)
  end

  def self.convert_to_period(date)
    "#{date.year}#{date.cweek}".to_i
  end

  def self.next
    convert_to_period(Date.today + 7.days)
  end

  def self.last
    convert_to_period(Date.today - 7.days)
  end

  def self.previous
    last
  end
end
