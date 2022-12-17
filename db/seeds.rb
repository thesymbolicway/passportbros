# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'Creating users...'

u1 = User.create!(first_name: 'Danny', last_name: 'Arisa', username: 'danny', password: '1234', profile_image: 'https://i.ibb.co/B6ZC0h5/pexels-martin-lopez-2240772.jpg')
u2 = User.create!(first_name: 'Bruno', last_name: 'Salvadori', username: 'bruno', password: '1234', profile_image: 'https://i.ibb.co/hc2xcCQ/pexels-bruno-salvadori-2269872.jpg')
u3 = User.create!(first_name: 'Pedro', last_name: 'Cervantes', username: 'pedroc', password: '1234', profile_image: 'https://i.ibb.co/4VbYMsj/pexels-spencer-selover-428328.jpg')
u4 = User.create!(first_name: 'Davis', last_name: 'Ike', username: 'ike', password: '1234', profile_image: 'https://i.ibb.co/28sYnmF/pexels-stephen-westby-13326901.jpg')

puts 'Creating places...'

p1 = Place.create!(city: 'Pattaya City', country: 'Thailand', latitude: '12.927608', longitude: '100.877083')
p2 = Place.create!(city: 'Rio de Janeiro', country: 'Brazil', latitude: '-22.908333', longitude: '-43.196388')
puts 'Creating points...'

poi1 = Point.create!(name: 'Flexx Club', image: 'https://i.ibb.co/t8Ntmbc/343-507461938.jpg', note: 'The ONLY club in Pattaya where HIP HOP, R&B, REGGAE, SOUL, AFRO BEATS & RAP is all you will hear all night', user_id: u1.id, place_id: p1.id, category: 'Club')
poi2 = Point.create!(name: 'Dicey Reilly\'s', image: 'https://i.ibb.co/tKXHNHg/307583828-10158399374832827-1871616337893348698-n.jpg', note: 'Sometimes, only a pub will do. Dicey Reilly\'s is the perfect pub for you. Book a party, dinner or event. Watch the game or start one of your own. Order a round of drinks and grub for you and all your friends.', user_id: u1.id, place_id: p1.id, category: 'Food')
poi3 = Point.create!(name: 'Koh Larn', image: 'https://i.ibb.co/kHH7S3Z/2013-10-24-samae-beach-03-crop-u833792.jpg', note: 'Very clear water, lovely beaches, quiete island', user_id: u1.id, place_id: p1.id, category: 'Beach')

poi4 = Point.create!(name: 'Baile Charme de Madureira', image: 'https://i.ibb.co/KqhR2Rw/Screen-Shot-2022-11-03-at-9-05-51-PM.png', note: 'One of the oldest black dance clubs in Rio de Janeiro', user_id: u2.id, place_id: p2.id, category: 'Club')
poi5 = Point.create!(name: 'Bar do David', image: 'https://i.ibb.co/DPFcWnB/Screen-Shot-2022-11-05-at-10-35-58-PM.png', note: 'David and his team represent everything beautiful about the hustle and bustle of community', user_id: u2.id, place_id: p2.id, category: 'Food')
poi6 = Point.create!(name: 'Copacabana', image: 'https://i.ibb.co/0XkqMWd/Praia-de-Copacabana-Rio-de-Janeiro-Brasil.jpg', note: 'Undoubtedly the most famous beach in Rio', user_id: u2.id, place_id: p2.id, category: 'Beach')

puts 'Seeding Review...'

r1 = Review.create!(comment: 'Had an amazing time!', rating: 5, user_id: u1.id, point_id: poi1.id)
r2 = Review.create!(comment: 'How busy are they on a weekend?', rating: 4, user_id: u2.id, point_id: poi1.id)
r3 = Review.create!(comment: 'Will definitely come back!', rating: 3, user_id: u3.id, point_id: poi3.id)
r4 = Review.create!(comment: 'Loved it!', rating: 5, user_id: u4.id, point_id: poi2.id)


c1 = Comment.create!(body: 'First comment', user_id: u1.id, place_id: p2.id)
c2 = Comment.create!(body: 'Second comment', user_id: u2.id, place_id: p2.id)
c3 = Comment.create!(body: 'First comment, first child', user_id: u2.id, place_id: p2.id, parent_id: 1)
c4 = Comment.create!(body: 'Second comment, second child', user_id: u2.id, place_id: p2.id, parent_id:2)

puts 'Done seeding!'

