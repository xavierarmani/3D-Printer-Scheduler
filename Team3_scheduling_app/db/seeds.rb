# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = [
  {:userName => 'admin', :email => 'admin@lewisu.edu',
    :password => 'Admin123', :admin => true}
]

user.each do |req|
    User.create!(req)
end






