
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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