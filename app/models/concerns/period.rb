class Period
  def self.current
    convert_to_period(Date.today)
  end

  def self.convert_to_period(date)
    "#{date.year}#{date.cweek}".to_i
  end
end
