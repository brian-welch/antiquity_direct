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
    e.yield '     Working.      '
    e.yield '     Working .     '
    e.yield '     Working  .    '
    e.yield '     Working   .   '
    e.yield '     Working    .  '
    e.yield '     Working     . '
    e.yield '     Working      .'
  end
end

## destroying artifacts, must be done to seed category tables
puts "\nDestroying all Artifacts in database....."

## initiating facy status message
progress = Thread.new do
  loop do
    printf("\r%s", wave.next)
    sleep(0.1)
  end
end
sleep 3
Artifact.destroy_all
puts " All Artifacts deleted!\n\n"

puts 'Destroying all Conditions in database.....'
sleep 3
Condition.destroy_all
puts " All Conditions deleted!\n\n"

## kills status message operation
progress.exit

## adds border for asthetics
puts '-' * 50

puts "\nPopulating Conditions......"

## seed conditions table form array
conditions = %w[perfect "like new" good rustic "shows wear" ramshackle]
conditions.each do |condition|
  new_condition = Condition.new(name: condition)
  new_condition.save!
end
puts "\n              - Conditions in database: #{Condition.count}!\n\n"



