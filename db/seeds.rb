require 'json'
require 'open-uri'
require 'nokogiri'

## clears terminal window
system 'clear'

## adds arty farty title to terminal
puts '*' * 23
puts ' Seeding your database'
puts '*' * 23
puts '-' * 50 + "\n"

## codes fancy status message
wave = Enumerator.new do |e|
  loop do
    e.yield '     Working)      '
    e.yield '     Working )     '
    e.yield '     Working  )    '
    e.yield '     Working   )   '
    e.yield '     Working    )  '
    e.yield '     Working     ) '
    e.yield '     Working      )'
    e.yield '     Working       '
    e.yield '     Working      ('
    e.yield '     Working     ( '
    e.yield '     Working    (  '
    e.yield '     Working   (   '
    e.yield '     Working  (    '
    e.yield '     Working (     '
    e.yield '     Working(      '
    e.yield '     Working       '
  end
end

## initiating facy status message
progress = Thread.new do
  loop do
    printf("\r%s", wave.next)
    sleep(0.05)
  end
end

## destroying all tables
puts "\nDestroying all Artifacts in database....."

sleep 3
Artifact.destroy_all
puts " All Artifacts deleted!\n\n"


puts 'Destroying all Users in database.....'
sleep 1
User.destroy_all
puts " All Users deleted!\n\n"


puts 'Destroying all Bookings in database.....'
sleep 1
Booking.destroy_all
puts " All Bookings deleted!\n\n"


puts 'Destroying all Conditions in database.....'
sleep 1
Condition.destroy_all
puts " All Conditions deleted!\n\n"


puts 'Destroying all Cultural Origins in database.....'
sleep 1
CulturalOrigin.destroy_all
puts " All Cultural Origins deleted!\n\n"


puts 'Destroying all Artifact Types in database.....'
sleep 1
ArtifactType.destroy_all
puts " All Artifact Types deleted!\n\n"


puts 'Destroying all Time Periods in database.....'
sleep 1
TimePeriod.destroy_all
puts " All Time Periods deleted!\n\n"


## adds border for asthetics
puts '-' * 50


## seed conditions table form array
puts "\nPopulating Conditions......"
sleep 1
conditions = ['mint', 'like new', 'good', 'rustic', 'shows wear', 'ramshackle']
conditions.each do |condition|
  new_condition = Condition.new(name: condition)
  new_condition.save!
end
puts "\n              - Conditions in database: #{Condition.count}!\n"


## seed cultural origins table form array
puts "\nPopulating Cultural Origins......"
sleep 1
cultural_origins = ['ancient greek', 'roman', 'chinese dynastic', 'western', 'far-eastern', 'viking', 'mesopotamian', 'babylonian', 'ancient eqymptian', 'australatian', 'polynesian', 'inowit']
cultural_origins.each do |cultural_origin|
  new_cultural_origin = CulturalOrigin.new(name: cultural_origin)
  new_cultural_origin.save!
end
puts "\n              - Cultural cultural_origins in database: #{CulturalOrigin.count}!\n"


## seed artifact types table form array
puts "\nPopulating Artifact Types......"
sleep 1
artifact_types = ['armour', 'weapon', 'book', 'scroll', 'painting', 'toy', 'map', 'invention', 'clothing', 'skulpture', 'building', 'accessory']
artifact_types.each do |artifact_type|
  new_artifact_type = ArtifactType.new(name: artifact_type)
  new_artifact_type.save!
end
puts "\n              - Artifact Type in database: #{ArtifactType.count}!\n"


## seed time periods table form array
puts "\nPopulating Time Periods......"
sleep 1
time_periods = ['middle ages', 'iron age', 'bronze age', 'renaissance', 'colonial times', 'pre-historic', 'industrial revolution', 'age of discovery', 'victorian era']
time_periods.each do |time_period|
  new_time_period = TimePeriod.new(name: time_period)
  new_time_period.save!
end
puts "\n              - Time Periods in database: #{TimePeriod.count}!\n"


## seed users table form array
puts "\nPopulating Users......"
sleep 1
new_time_period = User.new(first_name: 'brian',
                           last_name: 'welch',
                           phone_number: '',
                           average_rating: 0.0,
                           email: 'myself@brianwelch.se',
                           password: 'brianbrian',
                           photo: 'https://kitt.lewagon.com/placeholder/users/brian-welch')
new_time_period.save!
new_time_period = User.new(first_name: 'beltrán',
                           last_name: 'Sainz de vicuña nowack',
                           phone_number: '',
                           average_rating: 0.0,
                           email: 'gorthor@gmail.com',
                           password: 'beltranbeltran',
                           photo: 'https://kitt.lewagon.com/placeholder/users/BSdVN')
new_time_period.save!
new_time_period = User.new(first_name: 'makena',
                           last_name: 'hawley',
                           phone_number: '',
                           average_rating: 0.0,
                           email: 'makena.hawley@gmail.com',
                           password: 'makenamakena',
                           photo: 'https://kitt.lewagon.com/placeholder/users/Makenahawley')
new_time_period.save!
puts "\n              - Users in database: #{User.count}!\n"


## seed artifacts table form array
puts "\nPopulating Artifacts......"
sleep 1
Artifact.create!([
  {
    name: "Winged Hussar's Armour",
    photo: "hussar_armour.jpg",
    time_period: TimePeriod.find_by_name('middle ages'),
    cultural_origin: CulturalOrigin.find_by_name('western'),
    artifact_type: ArtifactType.find_by_name('armour'),
    condition: Condition.find_by_name('mint'),
    price: (rand(5..7) * 5 * rand(223..230)),
    user: User.find_by_email('myself@brianwelch.se')
    }, {
    name: "U.S. Model 1918 Mark I Trench Knife",
    photo: "trench_knife.jpg",
    time_period: TimePeriod.find_by_name('middle ages'),
    cultural_origin: CulturalOrigin.find_by_name('far-eastern'),
    artifact_type: ArtifactType.find_by_name('weapon'),
    condition: Condition.find_by_name('rustic'),
    price: (rand(5..7) * 5 * rand(223..230)),
    user: User.find_by_email('myself@brianwelch.se')
    }, {
    name: "Napoleon Bonaparte's Gold Laurel Wreath",
    photo: "laurel_wreath.png",
    time_period: TimePeriod.find_by_name('middle ages'),
    cultural_origin: CulturalOrigin.find_by_name('western'),
    artifact_type: ArtifactType.find_by_name('accessory'),
    condition: Condition.find_by_name('good'),
    price: (rand(5..7) * 5 * rand(223..230)),
    user: User.find_by_email('gorthor@gmail.com')
  }, {
    name: "Samurai Armour",
    photo: "samurai.jpg",
    time_period: TimePeriod.find_by_name('middle ages'),
    cultural_origin: CulturalOrigin.find_by_name('far-eastern'),
    artifact_type: ArtifactType.find_by_name('armour'),
    condition: Condition.find_by_name('like new'),
    price: (rand(5..7) * 5 * rand(223..230)),
    user: User.find_by_email('gorthor@gmail.com')
    }, {
    name: "Terracotta Warrior/s",
    photo: "terracotta-warriors.jpg",
    time_period: TimePeriod.find_by_name('middle ages'),
    cultural_origin: CulturalOrigin.find_by_name('far-eastern'),
    artifact_type: ArtifactType.find_by_name('skulpture'),
    condition: Condition.find_by_name('ramshackle'),
    price: (rand(5..7) * 5 * rand(223..230)),
    user: User.find_by_email('makena.hawley@gmail.com')
  }
])

puts "\n              - Artifacts in database: #{Artifact.count}!\n"


## kills status message operation
progress.exit
