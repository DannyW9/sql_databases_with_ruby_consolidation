require('pry-byebug')
require_relative('models/film.rb')
require_relative('models/customer.rb')
require_relative('models/ticket.rb')
require_relative('models/screening.rb')

Ticket.delete_all()
Screening.delete_all()
Film.delete_all()
Customer.delete_all()

################# FILMS ###################

film1 = Film.new({
  'title' => 'John Wick: Chapter 3',
  'price' => '10'
  })

film1.save()

film2 = Film.new({
  'title' => 'The Lion King',
  'price' => '15'
  })

film2.save()

# film3 = Film.new({
#   'title' => 'Avengers: Endgame',
#   'price' => '12'
#   })
#
# film3.save()

################# CUSTOMERS ###################

customer1 = Customer.new({
  'name' => 'Jax Teller',
  'funds' => '100'
  })

customer1.save()

customer2 = Customer.new({
  'name' => 'Gemma Morrow',
  'funds' => '150'
  })

customer2.save()

customer3 = Customer.new({
  'name' => 'Opie Winston',
  'funds' => '200'
  })

customer3.save()

################# SCREENINGS ###################

screening1 = Screening.new({
  'showing_time' => '19:00',
  'film_title' => "#{film1.title}"
  })

screening1.save()

screening2 = Screening.new({
  'showing_time' => '22:00',
  'film_title' => "#{film1.title}"
  })

screening2.save()

screening3 = Screening.new({
  'showing_time' => '17:00',
  'film_title' => "#{film2.title}"
  })

screening3.save()

screening4 = Screening.new({
  'showing_time' => '20:00',
  'film_title' => "#{film2.title}"
  })

screening4.save()

  ################# TICKETS ###################

ticket1 = Ticket.new({
  'customer_id' => "#{customer1.id}",
  'film_id' => "#{film1.id}",
  'screening_id' => "#{screening1.id}"
  })

ticket1.save()

ticket2 = Ticket.new({
  'customer_id' => "#{customer2.id}",
  'film_id' => "#{film1.id}",
  'screening_id' => "#{screening2.id}"
  })

ticket2.save()

ticket3 = Ticket.new({
  'customer_id' => "#{customer3.id}",
  'film_id' => "#{film1.id}",
  'screening_id' => "#{screening1.id}"
  })

ticket3.save()

ticket4 = Ticket.new({
  'customer_id' => "#{customer1.id}",
  'film_id' => "#{film2.id}",
  'screening_id' => "#{screening4.id}"
  })

ticket4.save()

ticket5 = Ticket.new({
  'customer_id' => "#{customer3.id}",
  'film_id' => "#{film2.id}",
  'screening_id' => "#{screening3.id}"
  })

ticket5.save()

customer1.update_funds()
customer2.update_funds()
customer3.update_funds()




binding.pry
nil
