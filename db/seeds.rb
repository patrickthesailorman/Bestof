# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.create(firstname: 'Patrick', lastname: 'McCarty', username: 'Patrickthesailorman', password: '123123123', email: 'patrickthesailorman@gmail.com')
admin.add_role :admin
#categories = Category.create([{name: 'Bars'}, {name: 'Beaches'}, {name: 'Cafes'}, {name: 'Restaurants'}, {name: 'Nightlife'}, {name: 'Pizza'}, {name: 'Sushi'}, {name: 'Seafood'}])
#categories = Category.create([{name: 'Scenic'}, {name: 'Marinas'}, {name: 'Parks'}, {name: 'Music'}, {name: 'Events'}, {name: 'Things to do'}])
Category.create(:name => 'Bars')
Category.create(:name => 'Beaches')
Category.create(:name => 'Cafes')
Category.create(:name => 'Parks')
Category.create(:name => 'Restaurants')
Category.create(:name => 'Marina')
Category.create(:name => 'Pizza')
Category.create(:name => 'Sushi')
Category.create(:name => 'Seafood')
Category.create(:name => 'Things to do')
Category.create(:name => 'Scenic')
Category.create(:name => 'Shopping')
Category.create(:name => 'Music')
Category.create(:name => 'Events')
