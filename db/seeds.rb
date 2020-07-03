require "open-uri"

def handle_string_io_as_file(io, filename)
  return io unless io.class == StringIO
  file = Tempfile.new(["temp",".png"], encoding: 'ascii-8bit')
  file.binmode
  file.write io.read
  file.open
end

Order.destroy_all
Booking.destroy_all
Offer.destroy_all
Bar.destroy_all
Subscription.destroy_all
User.destroy_all



puts "Creating users.."

user1 = User.create(email: "come@gmail.com", password: "123456", password_confirmation: "123456", owner: true, premium: 1)
user2 = User.create(email: "simon@gmail.com", password: "123456", password_confirmation: "123456", owner: true, premium: 1)
user3 = User.create(email: "remi@gmail.com", password: "123456", password_confirmation: "123456", owner: true, premium: 1)
user4 = User.create(email: "nik@gmail.com", password: "123456", password_confirmation: "123456", owner: false, premium: 1)


puts "Users created."


puts "Creating subscriptions"

subscription1 = Subscription.create!(name: 'Free', premium: 1, description: 'Our free plan allows you to publish up to 3 offers a week', price: 0)
subscription2 = Subscription.create!(name: 'Silver', premium: 2, description: 'Our silver plan allows you to publish up to 5 offers a week', price: 50)
subscription3 = Subscription.create!(name: 'Gold', premium: 3, description: 'Our Gold plan allows you to publish as many offers as you wish!', price: 70)

puts "Subscriptions created"
puts "Creating bars.."

# template
# file1 = URI.open('https://images.pexels.com/photos/2459/stairs-home-loft-lifestyle.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500')
# file2 = URI.open('https://images.pexels.com/photos/584399/living-room-couch-interior-room-584399.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')
# file3 = URI.open('https://images.pexels.com/photos/1879061/pexels-photo-1879061.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500')
# flat2 = Flat.create!(user: user1, title: 'Neat appartment in Borne', city: "Barcelona", price: 250, description: "Hi, my name is Alf. I'm 74 years old and as my husband passed away 3 years ago I am feeling very lonely. ;) Looking for a nice student to share my flat with and have some deeeeep convos...", groceries: true, sexy_time: true, cooking: true)
# flat2.photos.attach(io: file2, filename: 'flat1.png', content_type: 'image/png')
# flat2.photos.attach(io: file1, filename: 'flat1.png', content_type: 'image/png')
# flat2.photos.attach(io: file3, filename: 'flat1.png', content_type: 'image/png')

#1
file1 = URI.open('https://cdn.eventinc.de/provider_pictures/pictures/000/025/181/cropped/location-koeln-cbe-cologne-locomondo.jpg?1553198136')
bar1 = Bar.new(user: user1, name: 'Bombay 47', location: "Carrer de Bori i Fontestà 24, Barcelona", description: "The top floor Monkey Bar with panoramic view and perfect sundowner terrace is the hot spot after dusk. An international choice of drinks and fine wine as well as bar snacks from the NENI kitchen are served. Regular DJ lines and live music events take place at the Monkey Bar. The bar can be booked exclusively upon request and has a direct express lift from street level.")
bar1.photos.attach(io: file1, filename: 'bar1.png', content_type: 'image/png')
bar1.save!

#2
file2 = URI.open('https://www.in-muenchen.de/bilder/2020/02/06/13526864/1562010690-contemporary-bar-muenchen-1bk4Wgxea.jpg')
bar2 = Bar.new(user: user1, name: 'Reineke Fuchs', location: "Carrer de València 260, Barcelona", description: "The top floor Monkey Bar with panoramic view and perfect sundowner terrace is the hot spot after dusk. An international choice of drinks and fine wine as well as bar snacks from the NENI kitchen are served. Regular DJ lines and live music events take place at the Monkey Bar. The bar can be booked exclusively upon request and has a direct express lift from street level.")
bar2.photos.attach(io: file2, filename: 'bar2.png', content_type: 'image/png')
bar2.save!
#3
file3 = URI.open('https://mixology.eu/wp-content/uploads/2019/01/Shuka_Bar_Frankfurt_01-The_Listener-2-768x544.jpg')
bar3 = Bar.new(user: user1, name: 'Bumann & Sohn', location: "Carrer de Balmes 127, Barcelona", description: "The top floor Monkey Bar with panoramic view and perfect sundowner terrace is the hot spot after dusk. An international choice of drinks and fine wine as well as bar snacks from the NENI kitchen are served. Regular DJ lines and live music events take place at the Monkey Bar. The bar can be booked exclusively upon request and has a direct express lift from street level.")
bar3.photos.attach(io: file3, filename: 'bar3.png', content_type: 'image/png')
bar3.save!
#4
file4 = URI.open('https://mixology.eu/wp-content/uploads/2019/04/TITELBILD_Bar-Altbau_DSC_4229.jpg')
bar4 = Bar.new(user: user2, name: 'Halle Tor 2', location: "Carrer del Pare Gallifa 53, Barcelona", description: "The top floor Monkey Bar with panoramic view and perfect sundowner terrace is the hot spot after dusk. An international choice of drinks and fine wine as well as bar snacks from the NENI kitchen are served. Regular DJ lines and live music events take place at the Monkey Bar. The bar can be booked exclusively upon request and has a direct express lift from street level.")
bar4.photos.attach(io: file4, filename: 'bar4.png', content_type: 'image/png')
bar4.save!
#5
file5 = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRXvw9LxfmGXPrdiT9MB-9K3FbPBIQM19YQ4oSnDQdPK2-Z6V5B&usqp=CAU')
bar5 = Bar.new(user: user2, name: 'Club Bahnhof Ehrenfeld', location: "Baixada de Sant Miquel 7, Barcelona", description: "The top floor Monkey Bar with panoramic view and perfect sundowner terrace is the hot spot after dusk. An international choice of drinks and fine wine as well as bar snacks from the NENI kitchen are served. Regular DJ lines and live music events take place at the Monkey Bar. The bar can be booked exclusively upon request and has a direct express lift from street level.")
bar5.photos.attach(io: handle_string_io_as_file(file5, 'bar5.png'), filename: 'bar5.png', content_type: 'image/png')
bar5.save!
#6
file6 = URI.open('https://media-cdn.tripadvisor.com/media/photo-s/08/2c/a7/13/cloud-9-sky-bar-lounge.jpg')
bar6 = Bar.new(user: user2, name: 'TripleA', location: "Carrer de Nàpols 150, Barcelona", description: "The top floor Monkey Bar with panoramic view and perfect sundowner terrace is the hot spot after dusk. An international choice of drinks and fine wine as well as bar snacks from the NENI kitchen are served. Regular DJ lines and live music events take place at the Monkey Bar. The bar can be booked exclusively upon request and has a direct express lift from street level.")
bar6.photos.attach(io: file6, filename: 'bar6.png', content_type: 'image/png')
bar6.save!
#7
file7 = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ_MGnmUMkLotDGQCQX2WmgYcdIjrvS4YZL8QPCj2R0BauLiuFu&usqp=CAU')
bar7 = Bar.new(user: user3, name: 'Berghain', location: "Carrer de Terol 24, Barcelona", description: "The top floor Monkey Bar with panoramic view and perfect sundowner terrace is the hot spot after dusk. An international choice of drinks and fine wine as well as bar snacks from the NENI kitchen are served. Regular DJ lines and live music events take place at the Monkey Bar. The bar can be booked exclusively upon request and has a direct express lift from street level.")
bar7.photos.attach(io: file7, filename: 'bar7.png', content_type: 'image/png')
bar7.save!
#8
file8 = URI.open('https://www.empire-riverside.de/site/assets/files/10619/skylinebar20upnightview_empireriversidehotel.2560x1600.jpg')
bar8 = Bar.new(user: user3, name: 'Yuca', location: "Carrer de Joan d'Àustria 170, Barcelona", description: "The top floor Monkey Bar with panoramic view and perfect sundowner terrace is the hot spot after dusk. An international choice of drinks and fine wine as well as bar snacks from the NENI kitchen are served. Regular DJ lines and live music events take place at the Monkey Bar. The bar can be booked exclusively upon request and has a direct express lift from street level.")
bar8.photos.attach(io: file8, filename: 'bar8.png', content_type: 'image/png')
bar8.save!

puts "Flats created."
puts "Creating offers.."#


offer1 = Offer.create!(bar: bar1, description: "Beer 2 for 1", start_time: DateTime.new(2020,07,03,12), end_time: DateTime.new(2020,07,03,17))
offer2 = Offer.create!(bar: bar2, description: "Shots free", start_time: DateTime.new(2020,07,03,12), end_time: DateTime.new(2020,07,03,17))
offer3 = Offer.create!(bar: bar3, description: "Lady's Drink for free", start_time: DateTime.new(2020,07,03,12), end_time: DateTime.new(2020,07,03,18))
offer4 = Offer.create!(bar: bar4, description: "Beer 3 for 1", start_time: DateTime.new(2020,07,03,13), end_time: DateTime.new(2020,07,03,18))
offer5 = Offer.create!(bar: bar5, description: "Vodka Bull 50% off", start_time: DateTime.new(2020,07,03,14), end_time: DateTime.new(2020,07,03,19))
offer6 = Offer.create!(bar: bar6, description: "Milk 2 for 1", start_time: DateTime.new(2020,07,03,15), end_time: DateTime.new(2020,07,03,20))
offer7 = Offer.create!(bar: bar7, description: "Free beer", start_time: DateTime.new(2020,07,03,16), end_time: DateTime.new(2020,07,03,20))
offer8 = Offer.create!(bar: bar8, description: "Wet T-shirt contest + free beer", start_time: DateTime.new(2020,07,03,16), end_time: DateTime.new(2020,07,03,20))


puts "Offers created."
puts "Creating Bookings.."
#Bookings
booking1 = Booking.create!(user: user1, offer: offer6)
booking2 = Booking.create!(user: user2, offer: offer7)
booking3 = Booking.create!(user: user3, offer: offer8)


puts "Bookings created."


