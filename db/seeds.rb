# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'tar Wars'}, { name: 'ord of the Rings'}])
#   Character.create(name: 'uke' movie: movies.first)

Tip.destroy_all
Trip.destroy_all
User.destroy_all
City.destroy_all
Company.destroy_all

#companies
company1 = Company.create!(name: 'TestCompany1', slack_sub_domain: 'lewagon-alumni')

# CITIES & THEIR PHOTOS

photo_paris = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1662485634/ReMost/paris_id5nmp.jpg")
paris = City.create(name: 'Paris')
paris.photo.attach(io: photo_paris, filename: 'paris.jpg', content_type: 'image/jpg')

photo_london = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1662485636/ReMost/london_krq8d9.jpg")
london = City.create(name: 'London')
london.photo.attach(io: photo_london, filename: 'london.jpg', content_type: 'image/jpg')

photo_dublin = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1662485632/ReMost/dublin_jyz38h.jpg")
dublin = City.create(name: 'Dublin')
dublin.photo.attach(io: photo_dublin, filename: 'dublin.jpg', content_type: 'image/jpg')

photo_brussels = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1662485635/ReMost/brussels_swwscr.jpg")
brussels = City.create(name: 'Brussels')
brussels.photo.attach(io: photo_brussels, filename: 'brussels.jpg', content_type: 'image/jpg')

photo_amsterdam = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1662485632/ReMost/amsterdam_jhskkq.jpg")
amsterdam = City.create(name: 'Amsterdam')
amsterdam.photo.attach(io: photo_amsterdam, filename: 'amsterdam.jpg', content_type: 'image/jpg')


# USERS & THEIR AVATARS
john = User.create(company: company1, city: paris, email: 'john@test.com', password: 123456, first_name: 'John', last_name: 'Smith', job_title: 'Forward Operations Engineer', department: 'Ops', languages: ['English', 'French'], open_to: ['Working together/side-by-side', 'Coffee', 'Casual chat'], slack_user: 'U03PQD9E3M1')
photo_john = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1662485635/ReMost/john_oyqjvw.jpg")
john.photo.attach(io: photo_john, filename: 'john.jpg', content_type: 'image/jpg')
john.save

bob = User.create(company: company1, city: london, email: 'bob@test.com', password: 123456, first_name: 'Bob', last_name: 'MacFarlane', job_title: 'Legacy Branding Associate', department: 'Marketing', languages: ['English', 'Scots'], open_to: ['Working together/side-by-side', 'Drinks', 'Casual chat'], slack_user: 'U03PQD9E3M1')
photo_bob = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1662485633/ReMost/bob_tg0nq6.jpg")
bob.photo.attach(io: photo_bob, filename: 'bob.jpg', content_type: 'image/jpg')
bob.save

jeanne = User.create(company: company1, city: london, email: 'jeanne@test.com', password: 123456, first_name: 'Jeanne', last_name: 'Dupont', job_title: 'Internal Tactics Technician', department: 'Sales', languages: ['English', 'French', 'Spanish'], open_to: ['Working together/side-by-side', 'Coffee', 'Dinner'], slack_user: 'U03PQD9E3M1')
photo_jeanne = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1662485635/ReMost/jeanne_aho5sc.jpg")
jeanne.photo.attach(io: photo_jeanne, filename: 'jeanne.jpg', content_type: 'image/jpg')
jeanne.save

leah = User.create(company: company1, city: london, email: 'leah@test.com', password: 123456, first_name: 'Leah', last_name: 'Johnson', job_title: 'Chief Response Officer', department: 'Sales', languages: ['English', 'Hebrew'], open_to: ['Working together/side-by-side', 'Weekend activity/meal', 'Casual chat'], slack_user: 'U03PQD9E3M1')
photo_leah = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1662485633/ReMost/leah_c8hlhz.jpg")
leah.photo.attach(io: photo_leah, filename: 'leah.jpg', content_type: 'image/jpg')
leah.save

anastasia = User.create(company: company1, city: dublin, email: 'anastasia@test.com', password: 123456, first_name: 'Anastasia', last_name: 'Golubeva', job_title: 'Product Resonance Designer', department: 'Product', languages: ['English', 'Russian'], open_to: ['Working together/side-by-side', 'Weekend activity/meal', 'Dinner'], slack_user: 'U03PQD9E3M1')
photo_anastasia = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1662485637/ReMost/anastasia_oxfjnf.jpg")
anastasia.photo.attach(io: photo_anastasia, filename: 'anastasia.jpg', content_type: 'image/jpg')
anastasia.save


# TRIPS

trip1 = Trip.create!(user: john, city: paris, start_date: 'Sat, 15 Oct 2022', end_date: 'Fri, 4 Nov 2022')
trip2 = Trip.create!(user: bob, city: brussels, start_date: 'Fri, 21 Oct 2022', end_date: 'Sat, 17 Dec 2022')
trip3 = Trip.create!(user: john, city: amsterdam, start_date: 'Sat, 5 Nov 2022', end_date: 'Sat, 26 Nov 2022')
trip4 = Trip.create!(user: jeanne, city: amsterdam, start_date: 'Sun, 6 Nov 2022', end_date: 'Wed, 16 Nov 2022')
trip5 = Trip.create!(user: leah, city: paris, start_date: 'Sat, 10 Sept 2022', end_date: 'Mon, 17 Oct 2022')

# TIPS
tip1 = Tip.create!(user: john, city: paris, location: 'RER St-Michel-Notre-Dame', name: 'Notre-Dame Cathedral', content: 'Just amazing, despite the ongoing works after the big fire. Strongly recommended!', rating: 5, category: 'Cultural')
tip2 = Tip.create!(user: john, city: paris, location: '7 Rue du Faubourg Montmartre, 75009 Paris', name: 'Bouillon Chartier', content: 'Cheap food, in a typical Parisian bistro atmosphere. Beautiful, but queues can be veeery long.', rating: 4, category: 'Restaurant')
tip3 = Tip.create!(user: bob, city: paris, location: '33 Rue La Fayette, 75009 Paris', name: 'WeWork Lafayette', content: 'Just the best (and most beautiful!) WeWork in Paris! Half the remote workers travelling to Paris stop there at some point.', rating: 5, category: 'Coworking')
tip4 = Tip.create!(user: jeanne, city: london, location: 'Gracechurch St, London EC3V 1LT', name: 'Leadenhall Market', content: 'Very Harry-Potteresque, but full of bankers having a pint after work. Worth a quick visit.', rating: 4, category: 'Cultural')
tip5 = Tip.create!(user: leah, city: london, location: '51 Roman Rd, Bethnal Green, London E2 0HU', name: 'London Buddhist Centre', content: 'My favourite temple in London by far! Everyone is lovely.', rating: 5, category: 'Worship')
tip6 = Tip.create!(user: leah, city: dublin, location: '47-48, Temple Bar, Dublin 2, D02 N725', name: 'Temple Bar Pub', content: 'Just a classic in the middle of Dublin. Very, very busy at times.', rating: 4, category: 'Bar')
tip7 = Tip.create!(user: anastasia, city: dublin, location: "Pl. de l'Atomium 1, 1020 Brussels", name: 'Atomium', content: 'Nice to see at least once, but some will be disappointed...', rating: 3, category: 'Art')
tip8 = Tip.create!(user: anastasia, city: brussels, location: 'Botanic Building, Boulevard Saint-Lazare 4 Saint-Josse-ten-Noode, 1210 Brussels', name: 'WeWork Botanic', content: "Many folks from our company come here when stopping by Brussels. The WeWork manager is my friend, so drop me a line if you're around and you'll get some perks!", rating: 5, category: 'Coworking')
