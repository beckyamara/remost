# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'tar Wars'}, { name: 'ord of the Rings'}])
#   Character.create(name: 'uke' movie: movies.first)

Tip.destroy_all
Place.destroy_all
Trip.destroy_all
User.destroy_all
City.destroy_all
Company.destroy_all


## COMPANIES

company1 = Company.create!(name: "AirBnBeer", slack_sub_domain: "T02NE0241", email_domain: "@airbnbeer.remost", company_code: "abcd123")



## CITIES & THEIR PHOTOS
photo_paris = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1662485634/ReMost/paris_id5nmp.jpg")
paris = City.create!(name: 'Paris, France', flag: '🇫🇷')
paris.photo.attach(io: photo_paris, filename: 'paris.jpg', content_type: 'image/jpg')

photo_london = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1662485636/ReMost/london_krq8d9.jpg")
london = City.create!(name: 'London, Greater London, England, United Kingdom', flag: '🇬🇧')
london.photo.attach(io: photo_london, filename: 'london.jpg', content_type: 'image/jpg')

photo_dublin = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1662485632/ReMost/dublin_jyz38h.jpg")
dublin = City.create!(name: 'Dublin, Ireland', flag: '🇮🇪')
dublin.photo.attach(io: photo_dublin, filename: 'dublin.jpg', content_type: 'image/jpg')

photo_brussels = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1662485635/ReMost/brussels_swwscr.jpg")
brussels = City.create!(name: 'Brussels, Brussels-Capital, Belgium', flag: '🇧🇪')
brussels.photo.attach(io: photo_brussels, filename: 'brussels.jpg', content_type: 'image/jpg')

photo_amsterdam = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1662485632/ReMost/amsterdam_jhskkq.jpg")
amsterdam = City.create!(name: 'Amsterdam, Amsterdam, North Holland, Netherlands', flag: '🇳🇱')
amsterdam.photo.attach(io: photo_amsterdam, filename: 'amsterdam.jpg', content_type: 'image/jpg')

photo_madrid = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1663167188/ReMost/madrid_qrov1i.jpg")
madrid = City.create!(name: 'Madrid, Madrid, Spain', flag: '🇪🇸')
madrid.photo.attach(io: photo_madrid, filename: 'madrid.jpg', content_type: 'image/jpg')

photo_lisbon = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1663167187/ReMost/lisbon_dqf5ut.jpg")
lisbon = City.create!(name: 'Lisbon, Lisbon, Portugal', flag: '🇵🇹')
lisbon.photo.attach(io: photo_lisbon, filename: 'lisbon.jpg', content_type: 'image/jpg')

photo_berlin = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1663167184/ReMost/berlin_ot0dou.jpg")
berlin = City.create!(name: 'Berlin, Germany', flag: '🇩🇪')
berlin.photo.attach(io: photo_berlin, filename: 'berlin.jpg', content_type: 'image/jpg')

photo_zurich = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1663167184/ReMost/zurich_oa9z3r.jpg")
zurich = City.create!(name: 'Zurich, Zürich, Switzerland', flag: '🇨🇭')
zurich.photo.attach(io: photo_zurich, filename: 'zurich.jpg', content_type: 'image/jpg')

photo_copenhagen = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1663167184/ReMost/copenhagen_qzhsoa.jpg")
copenhagen = City.create!(name: 'Copenhagen, Capital Region of Denmark, Denmark', flag: '🇩🇰')
copenhagen.photo.attach(io: photo_copenhagen, filename: 'copenhagen.jpg', content_type: 'image/jpg')



## USERS & THEIR AVATARS

marion = User.new(company: company1, city: london, email: 'marion@airbnbeer.remost', password: 123456, first_name: 'Marion', last_name: 'Salaun', job_title: 'Speedy Onboarding Specialist', department: 'HR', languages: ['English', 'French', 'Spanish', 'Dutch'], open_to: ['💻 Working together/side-by-side', '🍻 Drinks', '💬 Casual chat'], slack_user: 'U03PQD9E3M1')
photo_marion = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1663234417/ReMost/marion_pwlxzr.jpg")
marion.photo.attach(io: photo_marion, filename: 'marion.jpg', content_type: 'image/jpg')
marion.save

john = User.new(company: company1, city: paris, email: 'john@airbnbeer.remost', password: 123456, first_name: 'John', last_name: 'Smith', job_title: 'Forward Operations Engineer', department: 'Ops', languages: ['English', 'French'], open_to: ['💻 Working together/side-by-side', '☕ Coffee', '💬 Casual chat'], slack_user: 'U03PQD9E3M1')
photo_john = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1662485635/ReMost/john_oyqjvw.jpg")
john.photo.attach(io: photo_john, filename: 'john.jpg', content_type: 'image/jpg')
john.save

bob = User.new(company: company1, city: london, email: 'bob@airbnbeer.remost', password: 123456, first_name: 'Bob', last_name: 'MacFarlane', job_title: 'Legacy Branding Associate', department: 'Marketing', languages: ['English', 'Scots'], open_to: ['💻 Working together/side-by-side', '🍻 Drinks', '💬 Casual chat'], slack_user: 'U03PQD9E3M1')
photo_bob = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1662485633/ReMost/bob_tg0nq6.jpg")
bob.photo.attach(io: photo_bob, filename: 'bob.jpg', content_type: 'image/jpg')
bob.save

jeanne = User.new(company: company1, city: london, email: 'jeanne@airbnbeer.remost', password: 123456, first_name: 'Jeanne', last_name: 'Dupont', job_title: 'Internal Tactics Technician', department: 'Sales', languages: ['English', 'French', 'Spanish'], open_to: ['💻 Working together/side-by-side', '☕ Coffee', '🍲 Dinner'], slack_user: 'U03PQD9E3M1')
photo_jeanne = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1662485635/ReMost/jeanne_aho5sc.jpg")
jeanne.photo.attach(io: photo_jeanne, filename: 'jeanne.jpg', content_type: 'image/jpg')
jeanne.save

leah = User.new(company: company1, city: london, email: 'leah@airbnbeer.remost', password: 123456, first_name: 'Leah', last_name: 'Johnson', job_title: 'Chief Response Officer', department: 'Sales', languages: ['English', 'Hebrew'], open_to: ['💻 Working together/side-by-side', '🏃 Weekend activity/meal', '💬 Casual chat'], slack_user: 'U03PQD9E3M1')
photo_leah = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1662485633/ReMost/leah_c8hlhz.jpg")
leah.photo.attach(io: photo_leah, filename: 'leah.jpg', content_type: 'image/jpg')
leah.save

anastasia = User.new(company: company1, city: dublin, email: 'anastasia@airbnbeer.remost', password: 123456, first_name: 'Anastasia', last_name: 'Golubeva', job_title: 'Product Resonance Designer', department: 'Product', languages: ['English', 'Russian'], open_to: ['💻 Working together/side-by-side', '🏃 Weekend activity/meal', '🍲 Dinner'], slack_user: 'U03PQD9E3M1')
photo_anastasia = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1662485637/ReMost/anastasia_oxfjnf.jpg")
anastasia.photo.attach(io: photo_anastasia, filename: 'anastasia.jpg', content_type: 'image/jpg')
anastasia.save

bertrand = User.new(company: company1, city: london, email: 'bertrand@airbnbeer.remost', password: 123456, first_name: 'Bertrand', last_name: 'Martinot', job_title: 'Internal Security Architect', department: 'Engineering', languages: ['English', 'French'], open_to: ['💡 Brainstorming', '🍲 Lunch'], slack_user: 'U03PQD9E3M1')
photo_bertrand = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1663167130/ReMost/bertrand_m1zaqe.jpg")
bertrand.photo.attach(io: photo_bertrand, filename: 'bertrand.jpg', content_type: 'image/jpg')
bertrand.save

anthony = User.new(company: company1, city: berlin, email: 'anthony@airbnbeer.remost', password: 123456, first_name: 'Anthony', last_name: 'Balkus', job_title: 'Future Web Sales Associate', department: 'Sales', languages: ['English', 'Lithuanian', 'German'], open_to: ['🍻 Drinks', '🍲 Dinner'], slack_user: 'U03PQD9E3M1')
photo_anthony = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1663167129/ReMost/anthony_ltdylg.jpg")
anthony.photo.attach(io: photo_anthony, filename: 'anthony.jpg', content_type: 'image/jpg')
anthony.save

nick = User.new(company: company1, city: berlin, email: 'nick@airbnbeer.remost', password: 123456, first_name: 'Nick', last_name: 'Bain', job_title: 'Central Ideation Consultant', department: 'Sales', languages: ['English', 'Spanish', 'Polish'], open_to: ['💻 Working together/side-by-side', '🏃 Weekend activity/meal', '🥐 Breakfast'], slack_user: 'U03PQD9E3M1')
photo_nick = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1663167133/ReMost/nick_h8ojzb.jpg")
nick.photo.attach(io: photo_nick, filename: 'nick.jpg', content_type: 'image/jpg')
nick.save

beatriz = User.new(company: company1, city: london, email: 'beatriz@airbnbeer.remost', password: 123456, first_name: 'Beatriz', last_name: 'Bakker', job_title: 'Product Accountability Senior Intern', department: 'Product', languages: ['English', 'Spanish', 'Dutch'], open_to: ['💡 Brainstorming', '🍲 Dinner'], slack_user: 'U03PQD9E3M1')
photo_beatriz = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1663167131/ReMost/beatriz_chy5wd.jpg")
beatriz.photo.attach(io: photo_beatriz, filename: 'beatriz.jpg', content_type: 'image/jpg')
beatriz.save

pavel = User.new(company: company1, city: zurich, email: 'pavel@airbnbeer.remost', password: 123456, first_name: 'Pavel', last_name: 'Ivanov', job_title: 'Legacy Quality Planner', department: 'Product', languages: ['English', 'Russian'], open_to: ['☕ Coffee', '💬 Casual chat', '🤝 Networking at an event'], slack_user: 'U03PQD9E3M1')
photo_pavel = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1663167129/ReMost/pavel_b5koft.jpg")
pavel.photo.attach(io: photo_pavel, filename: 'pavel.jpg', content_type: 'image/jpg')
pavel.save

sam = User.new(company: company1, city: dublin, email: 'sam@airbnbeer.remost', password: 123456, first_name: 'Sam', last_name: 'Byrne', job_title: 'Dynamic Product Specialist', department: 'Product', languages: ['English', 'Irish Gaelic'], open_to: ['💻 Working together/side-by-side', '🍻 Drinks', '🍲 Lunch'], slack_user: 'U03PQD9E3M1')
photo_sam = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1663167129/ReMost/sam_qszf4c.jpg")
sam.photo.attach(io: photo_sam, filename: 'sam.jpg', content_type: 'image/jpg')
sam.save

ed = User.new(company: company1, city: paris, email: 'ed@airbnbeer.remost', password: 123456, first_name: 'Ed', last_name: 'Wilson', job_title: 'Senior Accounting Orchestrator', department: 'Finance', languages: ['English', 'French'], open_to: ['💻 Working together/side-by-side', '☕ Coffee', '🥐 Breakfast'], slack_user: 'U03PQD9E3M1')
photo_ed = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1663167130/ReMost/ed_qa6h4m.jpg")
ed.photo.attach(io: photo_ed, filename: 'ed.jpg', content_type: 'image/jpg')
ed.save

charlie = User.new(company: company1, city: dublin, email: 'charlie@airbnbeer.remost', password: 123456, first_name: 'Charlie', last_name: 'Rossi', job_title: 'Head of Corporate Resonance', department: 'Sales', languages: ['English', 'Italian'], open_to: ['💻 Working together/side-by-side', '🍻 Drinks'], slack_user: 'U03PQD9E3M1')
photo_charlie = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1663250945/ReMost/charlie_valtn3.jpg")
charlie.photo.attach(io: photo_charlie, filename: 'charlie.jpg', content_type: 'image/jpg')
charlie.save

mina = User.new(company: company1, city: amsterdam, email: 'mina@airbnbeer.remost', password: 123456, first_name: 'Mina', last_name: 'Heikkinnen', job_title: 'Sales Quality Representative', department: 'Sales', languages: ['English', 'Finnish'], open_to: ['💻 Working together/side-by-side', '☕ Coffee', '🥐 Breakfast'], slack_user: 'U03PQD9E3M1')
photo_mina = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1663252324/ReMost/mina_axghpx.jpg")
mina.photo.attach(io: photo_mina, filename: 'mina.jpg', content_type: 'image/jpg')
mina.save

anton = User.new(company: company1, city: madrid, email: 'anton@airbnbeer.remost', password: 123456, first_name: 'Anton', last_name: 'Schmid', job_title: 'Talent Security Director', department: 'HR', languages: ['English', 'Spanish', 'German'], open_to: ['💡 Brainstorming', '☕ Coffee', '🏃 Weekend activity/meal'], slack_user: 'U03PQD9E3M1')
photo_anton = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1663250944/ReMost/anton_y5x87w.jpg")
anton.photo.attach(io: photo_anton, filename: 'anton.jpg', content_type: 'image/jpg')
anton.save

ina = User.new(company: company1, city: berlin, email: 'ina@airbnbeer.remost', password: 123456, first_name: 'Ina', last_name: 'Demir', job_title: 'Interactive Identity Agent', department: 'HR', languages: ['English', 'German'], open_to: ['💻 Working together/side-by-side', '🍻 Drinks', '💡 Brainstorming'], slack_user: 'U03PQD9E3M1')
photo_ina = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1663250953/ReMost/ina_xb7fb4.jpg")
ina.photo.attach(io: photo_ina, filename: 'ina.jpg', content_type: 'image/jpg')
ina.save

anjali = User.new(company: company1, city: brussels, email: 'anjali@airbnbeer.remost', password: 123456, first_name: 'Anjali', last_name: 'Adhvaryu', job_title: 'Product Growth Marketing Branding Officer', department: 'Marketing', languages: ['English', 'Gujarati'], open_to: ['💻 Working together/side-by-side', '☕ Coffee', '🥐 Breakfast'], slack_user: 'U03PQD9E3M1')
photo_anjali = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1663250946/ReMost/anjali_hzmb7s.jpg")
anjali.photo.attach(io: photo_anjali, filename: 'anjali.jpg', content_type: 'image/jpg')
anjali.save

aakash = User.new(company: company1, city: amsterdam, email: 'aakash@airbnbeer.remost', password: 123456, first_name: 'Aakash', last_name: 'Patel', job_title: 'Senior Full-end Engineer', department: 'Engineering', languages: ['English', 'Hindi'], open_to: ['💻 Working together/side-by-side', '☕ Coffee', '💡 Brainstorming'], slack_user: 'U03PQD9E3M1')
photo_aakash = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1663250944/ReMost/aakash_xozrhi.jpg")
aakash.photo.attach(io: photo_aakash, filename: 'aakash.jpg', content_type: 'image/jpg')
aakash.save

paul = User.new(company: company1, city: lisbon, email: 'paul@airbnbeer.remost', password: 123456, first_name: 'Paul', last_name: 'Harris', job_title: 'Relational Java Associate', department: 'Engineering', languages: ['English', 'Portuguese'], open_to: ['💻 Working together/side-by-side', '☕ Coffee', '💡 Brainstorming'], slack_user: 'U03PQD9E3M1')
photo_paul = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1663250949/ReMost/paul_po3owz.jpg")
paul.photo.attach(io: photo_paul, filename: 'paul.jpg', content_type: 'image/jpg')
paul.save

fang = User.new(company: company1, city: london, email: 'fang@airbnbeer.remost', password: 123456, first_name: 'Fang', last_name: 'Zhang', job_title: 'Global Legal Intern', department: 'Admin', languages: ['English', 'Portuguese'], open_to: ['💻 Working together/side-by-side', '☕ Coffee'], slack_user: 'U03PQD9E3M1')
photo_fang = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1663250946/ReMost/fang_nxua1d.jpg")
fang.photo.attach(io: photo_fang, filename: 'fang.jpg', content_type: 'image/jpg')
fang.save

alba = User.new(company: company1, city: london, email: 'alba@airbnbeer.remost', password: 123456, first_name: 'Alba', last_name: 'Perez', job_title: 'Lead Travel Administrator', department: 'HR', languages: ['English', 'Spanish'], open_to: ['💻 Working together/side-by-side', '🍻 Drinks'], slack_user: 'U03PQD9E3M1')
photo_alba = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1663250944/ReMost/alba_x57tnn.jpg")
alba.photo.attach(io: photo_alba, filename: 'alba.jpg', content_type: 'image/jpg')
alba.save

effia = User.new(company: company1, city: brussels, email: 'effia@airbnbeer.remost', password: 123456, first_name: 'Effia', last_name: 'Akakpo', job_title: 'Lead Growth Engineer', department: 'Sales', languages: ['English', 'French'], open_to: ['💻 Working together/side-by-side', '☕ Coffee', '🏃 Weekend activity/meal'], slack_user: 'U03PQD9E3M1')
photo_effia = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1663250948/ReMost/effia_rs3q3v.jpg")
effia.photo.attach(io: photo_effia, filename: 'effia.jpg', content_type: 'image/jpg')
effia.save

benjamin = User.new(company: company1, city: london, email: 'benjamin@airbnbeer.remost', password: 123456, first_name: 'Benjamin', last_name: 'Muller', job_title: 'Technical Debt Designer', department: 'Product', languages: ['English', 'German'], open_to: ['💻 Working together/side-by-side', '💬 Casual chat', '🍻 Drinks'], slack_user: 'U03PQD9E3M1')
photo_benjamin = URI.open("https://res.cloudinary.com/dpw4sfx8d/image/upload/v1663250947/ReMost/benjamin_sgqp4o.jpg")
benjamin.photo.attach(io: photo_benjamin, filename: 'benjamin.jpg', content_type: 'image/jpg')
benjamin.save






## TRIPS - originally created for Demo Day, for days of SEPT 21, then 22, then 23 (more people there)

trip1 = Trip.create!(user: john, city: dublin, start_date: 'Sat, 15 Oct 2022', end_date: 'Mon, 31 Oct 2022')
trip2 = Trip.create!(user: bob, city: brussels, start_date: 'Sat, 01 Oct 2022', end_date: 'Tue, 18 Oct 2022')
trip3 = Trip.create!(user: jeanne, city: amsterdam, start_date: 'Sat, 5 Nov 2022', end_date: 'Sat, 26 Nov 2022')
trip4 = Trip.create!(user: leah, city: amsterdam, start_date: 'Sun, 6 Nov 2022', end_date: 'Wed, 16 Nov 2022')

trip5 = Trip.create!(user: anastasia, city: london, start_date: 'Thu, 15 Sept 2022', end_date: 'Tue, 20 Sept 2022')
trip7 = Trip.create!(user: anastasia, city: paris, start_date: 'Wed, 21 Sept 2022', end_date: 'Mon, 26 Sept 2022')
trip8 = Trip.create!(user: anastasia, city: madrid, start_date: 'Tue, 27 Sept 2022', end_date: 'Fri, 30 Sept 2022')
trip9 = Trip.create!(user: anastasia, city: zurich, start_date: 'Tue, 18 Oct 2022', end_date: 'Sun, 23 Oct 2022')
trip10 = Trip.create!(user: anastasia, city: amsterdam, start_date: 'Mon, 24 Oct 2022', end_date: 'Mon, 31 Oct 2022')
trip11 = Trip.create!(user: anastasia, city: copenhagen, start_date: 'Sat, 5 Nov 2022', end_date: 'Sat, 19 Nov 2022')

trip12 = Trip.create!(user: leah, city: london, start_date: 'Sun, 20 Nov 2022', end_date: 'Sun, 27 Nov 2022')
trip13 = Trip.create!(user: jeanne, city: paris, start_date: 'Thu, 22 Sept 2022', end_date: 'Wed, 28 Sept 2022')
trip14 = Trip.create!(user: bob, city: paris, start_date: 'Fri, 23 Sept 2022', end_date: 'Wed, 28 Sept 2022')
trip15 = Trip.create!(user: sam, city: paris, start_date: 'Fri, 23 Sept 2022', end_date: 'Wed, 28 Sept 2022')
trip16 = Trip.create!(user: ed, city: london, start_date: 'Sat, 17 Sept 2022', end_date: 'Tue, 20 Sept 2022')
trip17 = Trip.create!(user: pavel, city: paris, start_date: 'Fri, 23 Sept 2022', end_date: 'Thu, 29 Sept 2022')
trip18 = Trip.create!(user: anthony, city: dublin, start_date: 'Sat, 01 Oct 2022', end_date: 'Sat, 8 Oct 2022')

trip19 = Trip.create!(user: marion, city: dublin, start_date: 'Mon, 17 Oct 2022', end_date: 'Mon, 31 Oct 2022')
trip20 = Trip.create!(user: marion, city: lisbon, start_date: 'Thu, 03 Nov 2022', end_date: 'Sun, 6 Nov 2022')
trip21 = Trip.create!(user: marion, city: amsterdam, start_date: 'Mon, 21 Nov 2022', end_date: 'Sun, 27 Nov 2022')
trip22 = Trip.create!(user: marion, city: madrid, start_date: 'Fri, 2 Dec 2022', end_date: 'Sun, 11 Dec 2022')




## PLACES

place1 = Place.create!(company: company1, location: '6 Parvis Notre-Dame - Pl. Jean-Paul II, 75004 Paris, France', city: paris, name: 'Notre-Dame Cathedral', category: '🎭 Cultural')
place2 = Place.create!(company: company1, location: '7 Rue du Faubourg Montmartre, 75009 Paris', city: paris, name: 'Bouillon Chartier', category: '🍽️ Restaurant')
place3 = Place.create!(company: company1, location: '33 Rue La Fayette, 75009 Paris', city: paris, name: 'WeWork Lafayette', category: '💻 Coworking')
place4 = Place.create!(company: company1, location: 'Gracechurch St, London EC3V 1LT', city: paris, name: 'Leadenhall Market', category: '🎭 Cultural')
place5 = Place.create!(company: company1, location: '51 Roman Rd, Bethnal Green, London E2 0HU', city: london, name: 'London Buddhist Centre', category: '🛐 Worship')
place6 = Place.create!(company: company1, location: '47-48, Temple Bar, Dublin 2, D02 N725', city: dublin, name: 'Temple Bar Pub', category: '🍹 Bar')
place7 = Place.create!(company: company1, location: "Pl. de l'Atomium 1, 1020 Brussels", city: brussels, name: 'Atomium', category: '🎨 Art')
place8 = Place.create!(company: company1, location: 'Botanic Building, Boulevard Saint-Lazare 4 Saint-Josse-ten-Noode, 1210 Brussels', city: brussels, name: 'WeWork Botanic', category: '💻 Coworking')
place9 = Place.create!(company: company1, location: 'Rua Da Atalaia 8, 1200-041 Lisbon, Lisboa, Portugal', city: lisbon, name: 'Primero de Maio', category: '🍽️ Restaurant')
place10 = Place.create!(company: company1, location: 'Av. 24 de Julho 49, 1200-479 Lisboa, Portugal', city: lisbon, name: 'TimeOut Market Lisbon', category: '🍽️ Restaurant')
place11 = Place.create!(company: company1, location: 'R. de Santa Cruz do Castelo, 1100-129 Lisboa, Portugal', city: lisbon, name: 'Castelo de S. Jorge', category: '🎭 Cultural')
place12 = Place.create!(company: company1, location: 'Museumplein 10, 1071 DJ Amsterdam, Netherlands', city: amsterdam, name: 'Stedelijk Museum', category: '🎨 Art')
place13 = Place.create!(company: company1, location: 'Herengracht 420, 1017 BZ Amsterdam, Netherlands', city: amsterdam, name: 'StartDock Coworking Herengracht', category: '💻 Coworking')
place14 = Place.create!(company: company1, location: 'Daniël Stalpertstraat 103, 1072 XD Amsterdam, Netherlands', city: amsterdam, name: 'Restaurant Zazas', category: '🍽️ Restaurant')
place15 = Place.create!(company: company1, location: 'B18-19 Parnell Square N, Rotunda, Dublin 1, D01 T3V8, Ireland', city: dublin, name: 'Chapter One', category: '🍽️ Restaurant')
place16 = Place.create!(company: company1, location: '31 Dawson St, Dublin 2, D02 DR58, Ireland', city: dublin, name: 'Peruke & Periwig', category: '🍹 Bar')
place17 = Place.create!(company: company1, location: '27 Camden Street Lower, Saint Kevins, Dublin 2, D02 NV09, Ireland', city: dublin, name: 'CoCreate South', category: '💻 Coworking')
place18 = Place.create!(company: company1, location: "52 Rue de l'Hôtel de Ville, 75004 Paris, France", city: paris, name: 'The Caféothèque of Paris', category: '☕️ Café')
place19 = Place.create!(company: company1, location: 'Jardin des Tuileries, Place de la Concorde, Paris, France', city: paris, name: 'Jardin des Tuileries', category: '🎾 Sports')
place20 = Place.create!(company: company1, location: '17 rue Pajol, 75018 Paris, France', city: paris, name: 'Temple de Ganesh', category: '🛐 Worship')
place21 = Place.create!(company: company1, location: 'Pl. de la Bataille de Stalingrad, 75019 Paris, France', city: paris, name: 'Stalingrad (metro)', category: '🛡️ Safety')




# ## TIPS
tip1 = Tip.create!(user: john, place: place1, content: 'Just amazing, despite the ongoing works after the big fire. Strongly recommended!', rating: 5)
tip2 = Tip.create!(user: john, place: place2, content: 'Cheap food, in a typical Parisian bistro atmosphere. Beautiful, but queues can be veeery long.', rating: 4)
tip3 = Tip.create!(user: bob, place: place3, content: 'Just the best (and most beautiful!) WeWork in Paris! Half the remote workers travelling to Paris stop there at some point.', rating: 5)
tip4 = Tip.create!(user: jeanne, place: place4, content: 'Very Harry-Potteresque, but full of bankers having a pint after work. Worth a quick visit.', rating: 4)
tip5 = Tip.create!(user: leah, place: place5, content: 'My favourite temple in London by far! Everyone is lovely.', rating: 5)
tip6 = Tip.create!(user: leah, place: place6, content: 'Just a classic in the middle of Dublin. Very, very busy at times.', rating: 4)
tip7 = Tip.create!(user: anastasia, place: place7, content: 'Nice to see at least once, but some will be disappointed...', rating: 3)
tip8 = Tip.create!(user: anastasia, place: place8, content: "Many folks from our company come here when stopping by Brussels. The WeWork manager is my friend, so drop me a line if you're around and you'll get some perks!", rating: 5)

tip9 = Tip.create!(user: sam, place: place9, content: "Typical Portuguese food, lovely service, in the middle of the party district.", rating: 8)
tip10 = Tip.create!(user: bertrand, place: place10, content: "Perfect to try various cuisines! Very busy, you might have to fight a bit to get a table...", rating: 9)
tip11 = Tip.create!(user: nick, place: place11, content: "Best spot to watch the sun set over the city. Also very interesting history.", rating: 9)

tip12 = Tip.create!(user: pavel, place: place12, content: "Go at least once!", rating: 8)
tip13 = Tip.create!(user: beatriz, place: place13, content: "My favorite coworking space in the city.", rating: 8)
tip14 = Tip.create!(user: ed, place: place14, content: "One of the best restaurants I've ever been to!", rating: 9)

tip15 = Tip.create!(user: beatriz, place: place15, content: "Definitely not cheap, but if you're in for some super luxe French food, that's the place to go!", rating: 9)
tip16 = Tip.create!(user: anthony, place: place16, content: "By far the best bar I've been to in Dublin. Their cocktails are just incredible", rating: 9)
tip17 = Tip.create!(user: anastasia, place: place17, content: "Decent CoWorking Space", rating: 7)

tip18 = Tip.create!(user: sam, place: place18, content: "Some say it's the best cafe in Paris... I think I agree!", rating: 8)
tip19 = Tip.create!(user: ed, place: place19, content: "Just the best place to go for a run, with a view on the river, musee du Louvre and its glass pyramid. Come early!", rating: 9)
tip20 = Tip.create!(user: nick, place: place20, content: "Best Hindu temple in Paris. Recommended by a friend", rating: 8)
tip21 = Tip.create!(user: beatriz, place: place21, content: "Just avoid this area at all costs at night, especially if you're alone. Lots of people roaming the street and strange behaviours...", rating: 0)


# # BOOKMARKED PLACES
# bookmark1 = BookmarkedPlace.create!(user: marion, tip: tip9)
# bookmark2 = BookmarkedPlace.create!(user: marion, tip: tip10)
# bookmark3 = BookmarkedPlace.create!(user: marion, tip: tip6)
# bookmark4 = BookmarkedPlace.create!(user: marion, tip: tip12)
# bookmark5 = BookmarkedPlace.create!(user: marion, tip: tip13)
# bookmark6 = BookmarkedPlace.create!(user: marion, tip: tip14)
