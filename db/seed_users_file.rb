def seed_users
    new_time_period = TimePeriod.new(first_name: 'brian',
                                     last_name: 'welch',
                                     phone_number: '',
                                     average_rating: 0.0,
                                     email: 'myself@brianwelch.se',
                                     password: 'brian')
    new_time_period.save!
    new_time_period = TimePeriod.new(first_name: 'beltràn',
                                     last_name: 'Sainz de vicuña nowack',
                                     phone_number: '',
                                     average_rating: 0.0,
                                     email: 'gorthor@gmail.com',
                                     password: 'beltràn')
    new_time_period.save!
    new_time_period = TimePeriod.new(first_name: 'makena',
                                     last_name: 'hawley',
                                     phone_number: '',
                                     average_rating: 0.0,
                                     email: 'makena.hawley@gmail.com',
                                     password: 'makena')
    new_time_period.save!
end
