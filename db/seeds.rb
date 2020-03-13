require "open-uri"
require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Destroying Users, Rooms, Chores, Bookings and Amenities"
Booking.destroy_all
WhiteboardMessage.destroy_all
User.destroy_all
Room.destroy_all
RoomChore.destroy_all
Chore.destroy_all
Amenity.destroy_all
puts "Destroyed Users, Rooms, Chores, Bookings and Amenities"


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
    description:'Bins are separated into PET Bottles, Assorted Glass, Cans, and Burnable Trash. Once a bin is full, please take it to the corresponding can outside: the trashmen will dispose of whatever is in the can on pickup day!'
  }
]

emails = [
  "rich.lynch@gmail.com",
  "will.nunn@gmail.com",
  "arnaud.rottier@gmail.com",
  "natalia.takahara@gmail.com",
  "dougiefresh@gmail.com",
  "tmoney@gmail.com",
]

names = [
  "Richie",
  "Will",
  "Arnaud",
  "Natalia",
  "Doug",
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
  "Hi, I'm Rich, from Philadelphia. I’ve been living in Japan for 2 years. I was working as a dentist in my hometown but now work as yoga teacher. I like watching movies.",
  "Hey, I'm Will, from San Francisco. I was working as an office worker in Paris. I enjoy listening to music.",
  "My name is Arnaud, from France. I’ve been learning English for 30 days. I am a Japanese teacher. I love to cook.",
  "Natalia, from Brazil. I’ve been learning Japanese for 5 weeks. I am a student. I enjoy listening to music.",
  "Hi, I'm Douglas. I'm a doctor. I like to DAAAANCE",
  "Trouni! I’m from France. I was working as an English teacher in my hometown. One of my hobbies is cooking chocolatine.",
]

amenities = [
  {
    name:'Iron',
    fa_class: 'iron.png'
  },
  {
    name:'Vacuum',
    fa_class: 'vacuum.png'
  },
  {
    name:'Shower',
    fa_class: 'shower.png'
  },
  {
    name:'Hair Dryer',
    fa_class: "hair_dryer.png"
  },
  {
    name:'Dryer',
    fa_class: 'dryer.png'

  },
  {
    name:'Washing Machine',
    fa_class: 'washing_machine.png'
  },
  {
    name:'Cinema Room',
    fa_class: 'cinema_room.png'
  },
   {
    name:'Kitchen',
    fa_class: 'kitchen.png'

  },
  {
    name:'Dining Room',
    fa_class: "dining_room.png"
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
    created_at: Faker::Time.between(from: DateTime.now - 600 , to: DateTime.now - 30)
  )
  user.save!
  user.add_points(rand(10)*10, category: 'room_chore_activity')
  file = File.open("app/assets/images/#{pictures[index]}")
  user.image.attach(io: file, filename: 'user.jpg', content_type: 'image/jpg')
  # url = open('https://le-wagon-tokyo.herokuapp.com/batches/363/student').read
  # file = URI.open(url)
  # user.image.attach(io: file, filename: 'user.jpg', content_type: 'image/jpg')

end

6.times do |n|
  Chore.all.each_with_index do |chore, index|
    status =
      if n > 1
        false
      elsif n < 1
        false
      else
        [true, false].sample
      end
    room_chore = RoomChore.new(
      start_date: Date.new(2020,3,9),
      end_date: Date.new(2020,3,15),
      chore: chore,
      period: Period.convert_to_period(Date.today + (n - 1).weeks),
      room: Room.all[(index + n) % Room.count],
      status: status
    )

    room_chore.save!
  end
end

puts "creating amenities and bookings for them..."

amenities.each do |amenity|
  new_amenity = Amenity.create!(amenity)
end


10.times do |n|
    start_booking = Faker::Time.between(from: DateTime.now , to: DateTime.now + 3)
    end_booking = start_booking + (900 * rand(1..10))

    new_booking = Booking.create!(
      start_date: start_booking,
      end_date: end_booking,
      room: Room.all.sample,
      amenity: Amenity.all.sample
      )
end

puts "created rooms, room_chores, chores, amenities and bookings! BooyaH!"
