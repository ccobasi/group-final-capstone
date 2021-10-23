User.destroy_all
City.destroy_all
Car.destroy_all
Reservation.destroy_all

users = User.create!([
  {username: 'jocyline', email:'jo@gmail.com', admin:true, password_digest:"jo@8"},
  {username: 'eri-ngozi', email:'er@gmail.com', admin:false, password_digest:"er@8"},
  {username: 'chukuma', email:'chuma@gmail.com', admin:false, password_digest:"chuma@8"},
  {username: 'irenehe', email:'irene@gmail.com', admin:false, password_digest:"iren@8"},
])

cities = City.create!([
  {name: 'Kampala'},
  {name: 'Nairobi'},
  {name: 'Abuja'},
  {name: 'Lagos'}
])

cars = Car.create!([
  {name: 'corona', image_data: 'helo' },
  {name: 'gypsum',  image_data: 'hhe'},
  {name: 'Prado', image_data: 'hhhe'},
  {name: 'Limozine', image_data: 'hhehe'}
])

reservations = Reservation.create!([
  {date: Date.new(), user_id: users[0].id, car_id: cars[0].id, reserve:false},
  {date: Date.new(), user_id: users[1].id, car_id: cars[1].id, reserve:false},
  {date: Date.new(), user_id: users[2].id, car_id: cars[2].id, reserve:false},
  {date: Date.new(), user_id: users[3].id, car_id: cars[3].id, reserve:true}
])

