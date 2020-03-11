require "open-uri"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying Users, Rooms, Chores and Amenities"
Booking.destroy_all
WhiteboardMessage.destroy_all
User.destroy_all
Room.destroy_all
RoomChore.destroy_all
Chore.destroy_all
Amenity.destroy_all
puts "Destroyed Users, Rooms, Chores and Amenities"


chores = [
  {
    name:'Kitchen',
    description:'Clean table and countertops, refill condiments, if any clean utensils or plates please put away.'
  },
  {
    name:'Living room',
    description:'Vacuum the carpeted areas, wipe down coffeetable, water the plants, and dust the windowsils as needed.'
  },
  {
    name:'Bathroom',
    description:'Clean the sink, toliet, shower, empty trashcan and replace toiletries as needed.'
  },
  {
    name:'Genkan',
    description:'Please clean up any outside debris, organize shoes, and sweep tiled area as needed.'
  },
  {
    name:'Cinema room',
    description:'Wipe down seats, clean projector lens with compressed air, and vacuum floor as needed.'
  },
  {
    name:'Trash',
    description:'Bins are separated into PET Bottles, Assorted Glass, Cans, and Burnable Trash. Once a bin is full, please take it to the corressponding can outside: the trashmen will dispose of whatever is in the can on pickup day!'
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
  "Richie",
  "Bill",
  "Arnaldo",
  "Orangina",
  "Ralphie",
  "Trouni",
]

pictures = [
  "rich.jpg",
  "will.jpeg",
  "arnald.jpg",
  "natalia.jpeg",
  "doug.jpeg",
  "Trouni.JPG"
]



bios = [
  "Hi, I'm Richie, from Malaysia. I’ve been learning Japanese for 2 years. I was working as a dentist in my home town. One of my hobbies is watching movies.",
  "Hey, I'm Will, from France. I’ve been learning Japanese for 30 days . I was working as a office worker in Paris. I enjoy listening to music.",
  "My name is Arnald, from South Korea. I’ve been learning English for 30 days .I am an Japanese teacher. One of my hobbies is cooking ",
  "Natalia, from Pakistan. I’ve been learning Japanese for 5 weeks .I am a student. I enjoy listening to music.",
  "Hi, I'm Doug. I'm a doctor. One of my hobbies is going to restaurants.",
  "Trouni! I’m from Russia. I was working as a English teacher in my home town. One of my hobbies is cooking chocolatine.",
]

amenities = [
  {
    name:'Iron',
    fa_class: 'fas fa-paper-plane'
  },
  {
    name:'Vacuum',
    fa_class: 'fas fa-broom'
  },
  {
    name:'Shower',
    fa_class: 'fas fa-bath'
  },
  {
    name:'Dryer',
    fa_class: 'fas fa-tint-slash'

  },
  {
    name:'Washing Machine',
    fa_class: 'fas fa-tint'
  },
  {
    name:'Cinema Room',
    fa_class: 'fas fa-film'
  },
   {
    name:'Kitchen',
    fa_class: 'fas fa-blender'

  },
  {
    name:'Dining Room',
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
    room: new_room,
    bio: bios[index],
  )
  user.save!
  file = File.open("app/assets/images/#{pictures[index]}")
  user.image.attach(io: file, filename: 'user.jpg', content_type: 'image/jpg')
  # url = open('https://le-wagon-tokyo.herokuapp.com/batches/363/student').read
  # file = URI.open(url)
  # user.image.attach(io: file, filename: 'user.jpg', content_type: 'image/jpg')

end

6.times do |n|
  Chore.all.each_with_index do |chore, index|
    room_chore = RoomChore.new(
      start_date: Date.new(2020,3,9),
      end_date: Date.new(2020,3,15),
      chore: chore,
      period: Period.convert_to_period(Date.today + (n - 1).weeks),
      room: Room.all[(index + n) % Room.count],
      status: [true, false].sample
    )
      room_chore.save!
  end
end

puts "creating amenities an bookings for them..."

amenities.each_with_index do |amenity, index|
  new_amenity = Amenity.new(amenity)
  new_amenity.save!
end

new_booking = Booking.new
new_booking.amenity = Amenity.find_by(name: "Cinema Room")
new_booking.room = User.find_by(first_name: "Richie").room
new_booking.start_date = DateTime.new(2020,03,20, 12, 0, 0)
new_booking.end_date = DateTime.new(2020,03,20, 18, 0, 0)
new_booking.save

puts "created rooms, room_chores, chores, amenities and bookings! BooyaH!"
