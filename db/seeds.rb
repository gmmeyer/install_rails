# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

brands = ['Other', 'Windows']
version = ['NA', 'NA']

brands.each do |brand|

  OperatingSystem.create(brand: brand, version: 'NA')

end

versions = ['10.5', '10.6', '10.7', '10.8', '10.9']

versions.each do |version|
  OperatingSystem.create(brand: 'Mac', version: version)
end



