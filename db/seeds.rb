# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

brands = ['Other', 'Windows']
version = ['NA', 'NA']

@windows = OperatingSystem.create(brand: "Windows", version: 'NA')
@other = OperatingSystem.create(brand: "Other", version: "NA")

versions = ['10.5', '10.6', '10.7', '10.8', '10.9']

versions.each do |version|
  OperatingSystem.create(brand: 'Mac', version: version)
end

@middle_macs = [
  OperatingSystem.find_by(brand: "Mac", version: "10.8"),
  OperatingSystem.find_by(brand: "Mac", version: "10.7"),
  OperatingSystem.find_by(brand: "Mac", version: "10.6")
]

@outer_macs = [
  OperatingSystem.find_by(brand: "Mac", version: "10.9"),
  OperatingSystem.find_by(brand: "Mac", version: "10.5")
]

require_relative("seed_pages/index")

