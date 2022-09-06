# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'tar Wars'}, { name: 'ord of the Rings'}])
#   Character.create(name: 'uke' movie: movies.first)


# USERS & THEIR AVATARS
john = User.create!(city_id: 1, email: 'john@test.com', password: 123456, first_name: 'John', last_name: 'Smith', job_title: 'Forward Operations Engineer', department: 'Ops', languages: ['English', 'French'], open_to: ['Working together/side-by-side', 'Coffee', 'Casual chat'], slack_user_id: 'U03PQD9E3M1')
photo_john = URI.open('https://images.unsplash.com/photo-1566492031773-4f4e44671857?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80')
john.photo.attach(io: photo_john, filename: 'john.jpg', content_type: 'image/jpg')
john.save

bob = User.create!(city_id: 2, email: 'bob@test.com', password: 123456, first_name: 'Bob', last_name: 'MacFarlane', job_title: 'Legacy Branding Associate', department: 'Marketing', languages: ['English', 'Scots'], open_to: ['Working together/side-by-side', 'Drinks', 'Casual chat'], slack_user_id: 'U03PQD9E3M1')
photo_bob = URI.open('https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80')
bob.photo.attach(io: photo_bob, filename: 'bob.jpg', content_type: 'image/jpg')
bob.save

jeanne = User.create!(city_id: 2, email: 'jeanne@test.com', password: 123456, first_name: 'Jeanne', last_name: 'Dupont', job_title: 'Internal Tactics Technician', department: 'Sales', languages: ['English', 'French', 'Spanish'], open_to: ['Working together/side-by-side', 'Coffee', 'Dinner'], slack_user_id: 'U03PQD9E3M1')
photo_jeanne = URI.open('https://images.unsplash.com/photo-1592621385612-4d7129426394?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80')
jeanne.photo.attach(io: photo_jeanne, filename: 'jeanne.jpg', content_type: 'image/jpg')
jeanne.save

leah = User.create!(city_id: 2, email: 'leah@test.com', password: 123456, first_name: 'Leah', last_name: 'Johnson', job_title: 'Chief Response Officer', department: 'Sales', languages: ['English', 'Hebrew'], open_to: ['Working together/side-by-side', 'Weekend activity/meal', 'Casual chat'], slack_user_id: 'U03PQD9E3M1')
photo_leah = URI.open('https://images.unsplash.com/photo-1542740348-39501cd6e2b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80')
leah.photo.attach(io: photo_leah, filename: 'leah.jpg', content_type: 'image/jpg')
leah.save

anastasia = User.create!(city_id: 3, email: 'anastasia@test.com', password: 123456, first_name: 'Anastasia', last_name: 'Golubeva', job_title: 'Product Resonance Designer', department: 'Product', languages: ['English', 'Russian'], open_to: ['Working together/side-by-side', 'Weekend activity/meal', 'Dinner'], slack_user_id: 'U03PQD9E3M1')
photo_anastasia = URI.open('https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=922&q=80')
anastasia.photo.attach(io: photo_anastasia, filename: 'anastasia.jpg', content_type: 'image/jpg')
anastasia.save

# CITIES & THEIR PHOTOS
paris = City.create!(name: 'Paris', photo: photo_paris)
photo_paris = URI.open('https://images.unsplash.com/photo-1471623432079-b009d30b6729?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80')
paris.photo.attach(io: photo_paris, filename: 'paris.jpg', content_type: 'image/jpg')

london = City.create!(name: 'London', photo: photo_london)
photo_london = URI.open('https://images.unsplash.com/photo-1520986606214-8b456906c813?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80')
london.photo.attach(io: photo_london, filename: 'london.jpg', content_type: 'image/jpg')

dublin = City.create!(name: 'Dublin', photo: photo_dublin)
photo_dublin = URI.open('https://images.unsplash.com/photo-1518005068251-37900150dfca?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1746&q=80')
dublin.photo.attach(io: photo_dublin, filename: 'dublin.jpg', content_type: 'image/jpg')

brussels = City.create!(name: 'Brussels', photo: photo_brussels)
photo_brussels = URI.open('https://images.unsplash.com/photo-1588023269387-596642593881?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80')
brussels.photo.attach(io: photo_brussels, filename: 'brussels.jpg', content_type: 'image/jpg')

amsterdam = City.create!(name: 'Amsterdam', photo: photo_amsterdam)
photo_amsterdam = URI.open('https://images.unsplash.com/photo-1512470876302-972faa2aa9a4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80')
amsterdam.photo.attach(io: photo_amsterdam, filename: 'amsterdam.jpg', content_type: 'image/jpg')

# TRIPS

trip1 = Trip.create!(user_id: 1, city_id: 4, start_date: 'Sat, 15 Oct 2022', end_date: 'Fri, 4 Nov 2022')
trip2 = Trip.create!(user_id: 2, city_id: 4, start_date: 'Fri, 21 Oct 2022', end_date: 'Sat, 17 Dec 2022')
trip3 = Trip.create!(user_id: 1, city_id: 5, start_date: 'Sat, 5 Nov 2022', end_date: 'Sat, 26 Nov 2022')
trip4 = Trip.create!(user_id: 3, city_id: 5, start_date: 'Sun, 6 Nov 2022', end_date: 'Wed, 16 Nov 2022')
trip5 = Trip.create!(user_id: 4, city_id: 1, start_date: 'Sat, 10 Sept 2022', end_date: 'Mon, 17 Oct 2022')

# TIPS
tip1 = Tip.create!(user_id: 1, city_id: 1, location: 'RER St-Michel-Notre-Dame', name: 'Notre-Dame Cathedral', content: 'Just amazing, despite the ongoing works after the big fire. Strongly recommended!', rating: 5, category: 'Cultural')
tip2 = Tip.create!(user_id: 1, city_id: 1, location: '7 Rue du Faubourg Montmartre, 75009 Paris', name: 'Bouillon Chartier', content: 'Cheap food, in a typical Parisian bistro atmosphere. Beautiful, but queues can be veeery long.', rating: 4, category: 'Restaurant')
tip3 = Tip.create!(user_id: 2, city_id: 1, location: '33 Rue La Fayette, 75009 Paris', name: 'WeWork Lafayette', content: 'Just the best (and most beautiful!) WeWork in Paris! Half the remote workers travelling to Paris stop there at some point.', rating: 5, category: 'Coworking')
tip4 = Tip.create!(user_id: 3, city_id: 2, location: 'Gracechurch St, London EC3V 1LT', name: 'Leadenhall Market', content: 'Very Harry-Potteresque, but full of bankers having a pint after work. Worth a quick visit.', rating: 4, category: 'Cultural')
tip5 = Tip.create!(user_id: 4, city_id: 2, location: '51 Roman Rd, Bethnal Green, London E2 0HU', name: 'London Buddhist Centre', content: 'My favourite temple in London by far! Everyone is lovely.', rating: 5, category: 'Worship')
tip6 = Tip.create!(user_id: 4, city_id: 3, location: '47-48, Temple Bar, Dublin 2, D02 N725', name: 'Temple Bar Pub', content: 'Just a classic in the middle of Dublin. Very, very busy at times.', rating: 4, category: 'Bar')
tip7 = Tip.create!(user_id: 5, city_id: 3, location: "Pl. de l'Atomium 1, 1020 Brussels", name: 'Atomium', content: 'Nice to see at least once, but some will be disappointed...', rating: 3, category: 'Art')
tip8 = Tip.create!(user_id: 5, city_id: 4, location: 'Botanic Building, Boulevard Saint-Lazare 4 Saint-Josse-ten-Noode, 1210 Brussels', name: 'WeWork Botanic', content: "Many folks from our company come here when stopping by Brussels. The WeWork manager is my friend, so drop me a line if you're around and you'll get some perks!", rating: 5, category: 'Coworking')
