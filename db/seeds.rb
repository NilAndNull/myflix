# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Category.all.empty?
  @tv_show_category = Category.create(name: 'TV Show')
  @tv_comedy_category = Category.create(name: 'TV Comedy')
end

if Video.all.empty?
  Video.create(title: 'Monk', 
               description: 'Adrian Monk is a brilliant San Francisco detective, whose obsessive compulsive disorder just happens to get in the way.',
               poster_url: '/tmp/monk.jpg',
               poster_large_url: '/tmp/monk_large.jpg',
               category: @tv_show_category)

  Video.create(title: 'Family Guy', 
               description: 'In a wacky Rhode Island town, a dysfunctional family strive to cope with everyday life as they are thrown from one crazy scenario to another.',
               poster_url: '/tmp/family_guy.jpg',
               category: @tv_comedy_category)

  Video.create(title: 'Futurama', 
               description: "Fry, a pizza guy is accidentally frozen in 1999 and thawed out New Year's Eve 2999.",
               poster_url: '/tmp/futurama.jpg',
               category: @tv_comedy_category)

  Video.create(title: 'South Park', 
               description: 'Follows the misadventures of four irreverent grade-schoolers in the quiet, dysfunctional town of South Park, Colorado.',
               poster_url: '/tmp/south_park.jpg',
               category: @tv_comedy_category)
end

