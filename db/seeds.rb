require 'json'
require 'open-uri'
require 'nokogiri'

require_relative 'seed_artifacts_file'
require_relative 'seed_cultural_origins_file'
require_relative 'seed_conditions_file'
require_relative 'seed_artifacts_types_file'
require_relative 'seed_time_periods_file'
require_relative 'seed_users_file'

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
    e.yield '     Working.      '
    e.yield '     Working .     '
    e.yield '     Working  .    '
    e.yield '     Working   .   '
    e.yield '     Working    .  '
    e.yield '     Working     . '
    e.yield '     Working      .'
  end
end

## initiating facy status message
progress = Thread.new do
  loop do
    printf("\r%s", wave.next)
    sleep(0.1)
  end
end

## destroying all tables
puts "\nDestroying all Artifacts in database....."

sleep 3
Artifact.destroy_all
puts " All Artifacts deleted!\n\n"


puts 'Destroying all Users in database.....'
sleep 3
User.destroy_all
puts " All Users deleted!\n\n"


puts 'Destroying all Bookings in database.....'
sleep 3
Booking.destroy_all
puts " All Bookings deleted!\n\n"


puts 'Destroying all Conditions in database.....'
sleep 3
Condition.destroy_all
puts " All Conditions deleted!\n\n"


puts 'Destroying all Cultural Origins in database.....'
sleep 3
CulturalOrigin.destroy_all
puts " All Cultural Origins deleted!\n\n"


puts 'Destroying all Artifact Types in database.....'
sleep 3
ArtifactType.destroy_all
puts " All Artifact Types deleted!\n\n"


puts 'Destroying all Time Periods in database.....'
sleep 3
TimePeriod.destroy_all
puts " All Time Periods deleted!\n\n"


## adds border for asthetics
puts '-' * 50


## seed conditions table form array
puts "\nPopulating Conditions......"
seed_conditions
puts "\n              - Conditions in database: #{Condition.count}!\n\n"


## seed cultural origins table form array
puts "\nPopulating Cultural Origins......"
seed_cultural_origins
puts "\n              - Cultural cultural_origins in database: #{CulturalOrigin.count}!\n\n"


## seed artifact types table form array
puts "\nPopulating Artifact Types......"
seed_artifacts_types
puts "\n              - Artifact Type in database: #{ArtifactType.count}!\n\n"


## seed time periods table form array
puts "\nPopulating Time Periods......"
seed_time_periods
puts "\n              - Time Periods in database: #{TimePeriod.count}!\n\n"


## seed users table form array
puts "\nPopulating Users......"
seed_users
puts "\n              - Users in database: #{User.count}!\n\n"

## seed artifacts table form array
puts "\nPopulating Artifacts......"
seed_artifacts
puts "\n              - Artifacts in database: #{Artifact.count}!\n\n"







## kills status message operation
progress.exit














Artifact.destroy_all
TimePeriod.destroy_all
CulturalOrigin.destroy_all

artifact_types = ArtifactType.create!([{
  name: "Armour"
},{
  name: "Weapon"
}, {
  name: "Artifact"
}
])

p artifact_types

cultural_origins = CulturalOrigin.create!([
  {
    name: "Western"
  }, {name: "Far-Eastern"
  }
])

time_period = TimePeriod.create!(name: "Middle Age")

artifacts = Artifact.create!([
  {
    name: "Winged Hussar's Armour",
    photo: "hussar_armour.jpg",
    time_period: time_period,
    cultural_origin: cultural_origins[0],
    artifact_type: artifact_types[0]
  }, {
    name: "U.S. Model 1918 Mark I Trench Knife",
    photo: "trench_knife.jpg",
    time_period: time_period,
    cultural_origin: cultural_origins[1],
    artifact_type: artifact_types[0]
  }, {
    name: "Napoleon Bonaparte's Gold Laurel Wreath",
    photo: "laurel_wreath.png",
    time_period: time_period,
    cultural_origin: cultural_origins[0],
    artifact_type: artifact_types[2]
  }, {
    name: "Samurai Armour",
    photo: "samurai.jpg",
    time_period: time_period,
    cultural_origin: cultural_origins[1],
    artifact_type: artifact_types[0]
  }, {
    name: "Terracotta Warrior/s",
    photo: "terracotta-warriors.jpg",
    time_period: time_period,
    cultural_origin: cultural_origins[1],
    artifact_type: artifact_types[2]
  }
])
