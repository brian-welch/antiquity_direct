def seed_time_periods
  time_periods = %w["middle ages" 'iron age' 'bronze age' renaissance 'colonial times' pre-historic 'industrial revolution' 'age of discovery' 'Victorian era']
  time_periods.each do |time_period|
    new_time_period = TimePeriod.new(name: time_period)
    new_time_period.save!
  end
end
