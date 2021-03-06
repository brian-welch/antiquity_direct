require 'json'
require 'open-uri'
require 'nokogiri'
require 'faker'

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
    e.yield '     Working)    '
    e.yield '     Working )   '
    e.yield '     Working  )  '
    e.yield '     Working   ) '
    e.yield '     Working    )'
    e.yield '     Working     '
    e.yield '     Working    ('
    e.yield '     Working   ( '
    e.yield '     Working  (  '
    e.yield '     Working (   '
    e.yield '     Working(    '
    e.yield '     Working     '
  end
end


## destroying all tables

puts 'Destroying all Bookings in database.....'

Booking.destroy_all
puts " All Bookings deleted!\n\n"

puts "\nDestroying all Artifacts in database....."


Artifact.destroy_all
puts " All Artifacts deleted!\n\n"


puts 'Destroying all Users in database.....'

User.destroy_all
puts " All Users deleted!\n\n"


puts 'Destroying all Conditions in database.....'

Condition.destroy_all
puts " All Conditions deleted!\n\n"


puts 'Destroying all Cultural Origins in database.....'

CulturalOrigin.destroy_all
puts " All Cultural Origins deleted!\n\n"


puts 'Destroying all Artifact Types in database.....'

ArtifactType.destroy_all
puts " All Artifact Types deleted!\n\n"


puts 'Destroying all Time Periods in database.....'

TimePeriod.destroy_all
puts " All Time Periods deleted!\n\n"


## adds border for asthetics
puts '-' * 50


## seed conditions table form array
puts "\nPopulating Conditions......"

conditions = ['mint', 'like new', 'good', 'rustic', 'shows wear', 'ramshackle']
conditions.each do |condition|
  new_condition = Condition.new(name: condition)
  new_condition.save!
end
puts "\n              - Conditions in database: #{Condition.count}!\n"


## seed cultural origins table form array
puts "\nPopulating Cultural Origins......"

cultural_origins = ['amazonian', 'ancient greek', 'roman', 'chinese dynastic', 'western', 'far-eastern', 'viking', 'mesopotamian', 'babylonian', 'ancient egyptian', 'australatian', 'polynesian', 'inowit', 'global']
cultural_origins.each do |cultural_origin|
  new_cultural_origin = CulturalOrigin.new(name: cultural_origin)
  new_cultural_origin.save!
end
puts "\n              - Cultural cultural_origins in database: #{CulturalOrigin.count}!\n"


## seed artifact types table form array
puts "\nPopulating Artifact Types......"

artifact_types = ['armour', 'weapon', 'book', 'scroll', 'painting', 'toy', 'map', 'invention', 'clothing', 'sculpture', 'building', 'accessory','transportation']
artifact_types.each do |artifact_type|
  new_artifact_type = ArtifactType.new(name: artifact_type)
  new_artifact_type.save!
end
puts "\n              - Artifact Type in database: #{ArtifactType.count}!\n"


## seed time periods table form array
puts "\nPopulating Time Periods......"

time_periods = ['middle ages', 'iron age', 'bronze age', 'renaissance', 'colonial times', 'pre-historic', 'industrial revolution', 'age of discovery', 'victorian era', 'ancient era']
time_periods.each do |time_period|
  new_time_period = TimePeriod.new(name: time_period)
  new_time_period.save!
end
puts "\n              - Time Periods in database: #{TimePeriod.count}!\n"


## seed users table form array
puts "\nPopulating Users......"

User.create(first_name: 'brian',
         last_name: 'welch',
         phone_number: '+46 734 33 32 32',
         average_rating: 0.0,
         email: 'myself@brianwelch.se',
         password: 'brianbrian',
         photo: 'https://kitt.lewagon.com/placeholder/users/brian-welch')
User.create(first_name: 'beltrán',
         last_name: 'Sainz de vicuña nowack',
         phone_number: '+45 456 34 45 56',
         average_rating: 0.0,
         email: 'gorthor@gmail.com',
         password: 'beltranbeltran',
         photo: 'https://kitt.lewagon.com/placeholder/users/BSdVN')
User.create(first_name: 'makena',
         last_name: 'hawley',
         phone_number: '+45 987 12 23 34',
         average_rating: 0.0,
         email: 'makena.hawley@gmail.com',
         password: 'makenamakena',
         photo: 'https://kitt.lewagon.com/placeholder/users/Makenahawley')
User.create(first_name: 'indiana',
         last_name: 'jones',
         phone_number: '867 - 5309',
         average_rating: 0.0,
         email: 'indiana.jones@crusades.com',
         password: 'indianajones',
         photo: 'https://i.pinimg.com/236x/92/b4/72/92b47266589b136e4fd806296527e5d6--harrison-ford-indiana-jones.jpg')

puts "\n              - Users in database: #{User.count}!\n"


## seed artifacts table form array
puts "\nPopulating Artifacts......"

Artifact.create!(
  [
    {
    name: "Winged Hussar's Armour",
    photo: "hussar_armour.jpg",
    time_period: TimePeriod.find_by_name('middle ages'),
    cultural_origin: CulturalOrigin.find_by_name('western'),
    artifact_type: ArtifactType.find_by_name('armour'),
    condition: Condition.find_by_name('mint'),
    price: (rand(5..7) * 5 * rand(32..43)),
    user: User.find_by_email('myself@brianwelch.se')
    }, {
    name: "U.S. Model 1918 Mark I Trench Knife",
    photo: "trench_knife.jpg",
    time_period: TimePeriod.find_by_name('middle ages'),
    cultural_origin: CulturalOrigin.find_by_name('far-eastern'),
    artifact_type: ArtifactType.find_by_name('weapon'),
    condition: Condition.find_by_name('rustic'),
    price: (rand(5..7) * 5 * rand(32..43)),
    user: User.find_by_email('myself@brianwelch.se')
    }, {
    name: "Napoléon Bonaparte's Gold Laurel Wreath",
    photo: "laurel_wreath.png",
    time_period: TimePeriod.find_by_name('middle ages'),
    cultural_origin: CulturalOrigin.find_by_name('western'),
    artifact_type: ArtifactType.find_by_name('accessory'),
    condition: Condition.find_by_name('good'),
    price: (rand(5..7) * 5 * rand(32..43)),
    user: User.find_by_email('gorthor@gmail.com')
    }, {
    name: "Samurai Armour",
    photo: "samurai.jpg",
    time_period: TimePeriod.find_by_name('middle ages'),
    cultural_origin: CulturalOrigin.find_by_name('far-eastern'),
    artifact_type: ArtifactType.find_by_name('armour'),
    condition: Condition.find_by_name('like new'),
    price: (rand(5..7) * 5 * rand(32..43)),
    user: User.find_by_email('gorthor@gmail.com')
    }, {
    name: "Terracotta Warriors",
    photo: "terracotta-warriors.jpg",
    time_period: TimePeriod.find_by_name('middle ages'),
    cultural_origin: CulturalOrigin.find_by_name('far-eastern'),
    artifact_type: ArtifactType.find_by_name('sculpture'),
    condition: Condition.find_by_name('ramshackle'),
    price: (rand(5..7) * 5 * rand(32..43)),
    user: User.find_by_email('makena.hawley@gmail.com')
    }, {
    name: "Leonardo Da Vinci's Sketch Book",
    photo: "https://media.fromthegrapevine.com/assets/images/2016/8/da-vinci-journals.jpg.824x0_q71.jpg",
    time_period: TimePeriod.find_by_name('renaissance'),
    cultural_origin: CulturalOrigin.find_by_name('roman'),
    artifact_type: ArtifactType.find_by_name('book'),
    condition: Condition.find_by_name('rustic'),
    price: (rand(5..7) * 5 * rand(32..43)),
    user: User.find_by_email('myself@brianwelch.se')
    }, {
    name: "King Arthur's Crown",
    photo: "https://i.pinimg.com/originals/08/b8/52/08b85226f747467f2e4d798f64290c98.jpg",
    time_period: TimePeriod.find_by_name('middle ages'),
    cultural_origin: CulturalOrigin.find_by_name('western'),
    artifact_type: ArtifactType.find_by_name('accessory'),
    condition: Condition.find_by_name('like new'),
    price: (rand(5..7) * 5 * rand(32..43)),
    user: User.find_by_email('makena.hawley@gmail.com')
    }, {
    name: "Genuine Wooly Mammoth Skeleton",
    photo: "https://upload.wikimedia.org/wikipedia/commons/a/ad/Siegsdorfer_Mammut.jpg",
    time_period: TimePeriod.find_by_name('pre-historic'),
    cultural_origin: CulturalOrigin.find_by_name('global'),
    artifact_type: ArtifactType.find_by_name('accessory'),
    condition: Condition.find_by_name('good'),
    price: (rand(5..7) * 5 * rand(32..43)),
    user: User.find_by_email('gorthor@gmail.com')
    }, {
    name: "Traditional Māori Boat",
    photo: "http://www.fionascannell.com/travelphotos/wp-content/main/2011_02/IMG_0859.jpg",
    time_period: TimePeriod.find_by_name('colonial times'),
    cultural_origin: CulturalOrigin.find_by_name('australatian'),
    artifact_type: ArtifactType.find_by_name('transportation'),
    condition: Condition.find_by_name('shows wear'),
    price: (rand(5..7) * 5 * rand(32..43)),
    user: User.find_by_email('gorthor@gmail.com')
    }, {
    name: "Thor's Hammer",
    photo: "http://orig07.deviantart.net/97b2/f/2013/251/6/5/thor_hammer_mjolnir__avengers_version__by_pannaus-d6lir5z.jpg",
    time_period: TimePeriod.find_by_name('iron age'),
    cultural_origin: CulturalOrigin.find_by_name('viking'),
    artifact_type: ArtifactType.find_by_name('weapon'),
    condition: Condition.find_by_name('mint'),
    price: (rand(5..7) * 5 * rand(32..43)),
    user: User.find_by_email('myself@brianwelch.se')
    }, {
    name: "Shrunken Head Collection",
    photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Seattle_-_Curiosity_Shop_-_shrunken_heads_02A.jpg/1200px-Seattle_-_Curiosity_Shop_-_shrunken_heads_02A.jpg",
    time_period: TimePeriod.find_by_name('colonial times'),
    cultural_origin: CulturalOrigin.find_by_name('amazonian'),
    artifact_type: ArtifactType.find_by_name('accessory'),
    condition: Condition.find_by_name('ramshackle'),
    price: (rand(5..7) * 5 * rand(32..43)),
    user: User.find_by_email('gorthor@gmail.com')
    }, {
    name: "Full Size Egyptian Mummy",
    photo: "https://r.hswstatic.com/w_907/gif/mummysarcophagus-prisma-uig-getty.jpg",
    time_period: TimePeriod.find_by_name('ancient era'),
    cultural_origin: CulturalOrigin.find_by_name('ancient egyptian'),
    artifact_type: ArtifactType.find_by_name('sculpture'),
    condition: Condition.find_by_name('rustic'),
    price: (rand(5..7) * 5 * rand(32..43)),
    user: User.find_by_email('makena.hawley@gmail.com')
    }, {
    name: "Arc of the Covenant",
    photo: "https://i.pinimg.com/originals/0c/42/1a/0c421a1df75877fb828d3183719aea00.jpg",
    time_period: TimePeriod.find_by_name('ancient era'),
    cultural_origin: CulturalOrigin.find_by_name('western'),
    artifact_type: ArtifactType.find_by_name('sculpture'),
    condition: Condition.find_by_name('mint'),
    price: (rand(5..7) * 5 * rand(32..43)),
    user: User.find_by_email('indiana.jones@crusades.com')
    }, {
    name: "Holy Grail",
    photo: "https://pre00.deviantart.net/1bb2/th/pre/i/2013/287/b/0/holy_grail_png_by_erdmute-d1nodd1.png",
    time_period: TimePeriod.find_by_name('ancient era'),
    cultural_origin: CulturalOrigin.find_by_name('western'),
    artifact_type: ArtifactType.find_by_name('accessory'),
    condition: Condition.find_by_name('mint'),
    price: (rand(5..7) * 5 * rand(32..43)),
    user: User.find_by_email('indiana.jones@crusades.com')
    }, {
    name: "The Cross of Coronado",
    photo: "https://c1.staticflickr.com/6/5022/5676418730_ea97850bcf_b.jpg",
    time_period: TimePeriod.find_by_name('ancient era'),
    cultural_origin: CulturalOrigin.find_by_name('western'),
    artifact_type: ArtifactType.find_by_name('accessory'),
    condition: Condition.find_by_name('mint'),
    price: (rand(5..7) * 5 * rand(32..43)),
    user: User.find_by_email('indiana.jones@crusades.com')
    }

  ]
)

puts "\n              - Artifacts in database: #{Artifact.count}!\n"


puts "\nPopulating Bookings......"

artifact_names = ["Winged Hussar's Armour",
                  "U.S. Model 1918 Mark I Trench Knife",
                  "Napoléon Bonaparte's Gold Laurel Wreath",
                  "Samurai Armour",
                  "Terracotta Warriors",
                  "Leonardo Da Vinci's Sketch Book",
                  "King Arthur's Crown",
                  "Genuine Wooly Mammoth Skeleton",
                  "Traditional Māori Boat",
                  "Thor's Hammer",
                  "Shrunken Head Collection",
                  "Full Size Egyptian Mummy",
                  "Arc of the Covenant",
                  "Holy Grail",
                  "The Cross of Coronado" ]
user_emails = ["makena.hawley@gmail.com",
               "gorthor@gmail.com",
               "myself@brianwelch.se",
               "indiana.jones@crusades.com" ]

32.times do
  year = ['2019', '2020'][rand(0..1)]
  month_one = rand(1..5)
  month_two = rand(7..12)
  day = rand(1..28)

  new_booking = Booking.new(artifact_id: Artifact.find_by_name(artifact_names[rand(0..14)]).id,
                 user_id: User.find_by_email(user_emails[rand(0..3)]).id,
                 check_out_date: ("#{year}-#{month_one}-#{day}"),
                 return_date: ("#{year}-#{month_two}-#{day}")
  )
  unless User.find(new_booking.user_id).artifacts.ids.include?(:artifact_id)
    new_booking.save
  else
  end
end

puts "\n              - Bookings in database: #{Booking.count}!\n"



