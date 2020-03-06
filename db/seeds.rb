require "open-uri"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying Users, Rooms, Chores and Amenities"
User.destroy_all
RoomChore.destroy_all
Chore.destroy_all
Room.destroy_all
Booking.destroy_all
Amenity.destroy_all
puts "Destroyed Users, Rooms, Chores and Amenities"


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

emails = [
  "rich@gmail.com",
  "will@gmail.com",
  "arnaud@gmail.com",
  "natalia@gmail.com",
  "dougiefresh@gmail.com",
  "tmoney@gmail.com",
]

names = [
  "Richie Ratchet",
  "Billy Boy",
  "Arnaldo",
  "Orangina",
  "Ralphie",
  "Trouni, My Little Chocolatine 🍫",
]

amenities = [
  {
    name:'Iron',
    availability: false,
    fa_class: 'fas fa-paper-plane'
  },
  {
    name:'Vacuum',
    availability: true,
    fa_class: 'fas fa-broom'
  },
  {
    name:'Shower',
    availability: false,
    fa_class: 'fas fa-bath'
  },
  {
    name:'Dryer',
    availability: false,
    fa_class: 'fas fa-tint-slash'

  },
  {
    name:'Washing Machine',
    availability: true,
    fa_class: 'fas fa-tint'
  },
  {
    name:'Cinema Room',
    availability: true,
    fa_class: 'fas fa-film'
  },
   {
    name:'Kitchen',
    availability: true,
    fa_class: 'fas fa-blender'

  },
  {
    name:'Dining Room',
    availability: true,
    fa_class: "fas fa-utensils"
  }

]

chores.each_with_index do |chore, index|
  new_chore = Chore.create!(chore)
  new_room = Room.create!(number: index + 101)
  user = User.new(
    email: emails[index],
    first_name: names[index],
    password: "123456",
    room: new_room
  )
  file = File.open("app/assets/images/user_photo.jpg")
  user.image.attach(io: file, filename: 'user.jpg', content_type: 'image/jpg')
  user.save!
end



6.times do |n|
  Chore.all.each_with_index do |chore, index|
    room_chore = RoomChore.new(
      start_date: Date.new(2020,3,9),
      end_date: Date.new(2020,3,15),
      chore: chore,
      period: Period.convert_to_period(Date.today + 1.week * n),
      room: Room.all[(index + n) % Room.count]
    )
      # binding.pry
      room_chore.save!
  end
end

amenities.each do |amenity|
  new_amenity = Amenity.create!(amenity)
end






puts "created rooms, room_chores, chores and amenities "
