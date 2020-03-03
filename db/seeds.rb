# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying Rooms and Chores"
Room.destroy_all
Chore.destroy_all
puts "Destroyed Rooms and Chores"


chores = [
  {
    name:'Dishes',
    description:'Located in the kitchen, please put away after drying.'
  },
  {
    name:'Vaccuming',
    description:'Vaccum the carpeted areas.'
  },
  {
    name:'Bathroom',
    description:'Clean the sinks, toliets, and showers.'
  },
  {
    name:'Kitchen',
    description:'Please clean up the tabletops, refill napkins, utensils, etc.'
  },
  {
    name:'Trash',
    description:'Make sure trash is recycled, and placed outside on Tuesday and Friday mornings.'
  },
  {
    name:'Shared Room',
    description:'The Livingroom, Diningroom, and Genkan.'
  }
]

chores.each_with_index do |chore, index|
  new_chore = Chore.create!(chore)
  new_room = Room.create!(number: index + 1)
end

6.times do |n|
  Chore.all.each_with_index do |chore, index|
    RoomChore.create!(
      chore: chore,
      period: n + 1,
      room: Room.all[index + n % 6]
    )
  end
end
