require('pry-byebug')
require_relative('models/film.rb')
require_relative('models/customer.rb')
require_relative('models/ticket.rb')

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

film3 = Film.new({
  'title' => 'Avengers: Endgame',
  'price' => '12'
  })

film3.save()

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

ticket1 = Ticket.new({
  'customer_id' => "#{customer1.id}",
  'film_id' => "#{film1.id}"
  })

ticket2 = Ticket.new({
  'customer_id' => "#{customer2.id}",
  'film_id' => "#{film1.id}"
  })

ticket3 = Ticket.new({
  'customer_id' => "#{customer3.id}",
  'film_id' => "#{film1.id}"
  })

ticket4 = Ticket.new({
  'customer_id' => "#{customer1.id}",
  'film_id' => "#{film2.id}"
  })

ticket5 = Ticket.new({
  'customer_id' => "#{customer3.id}",
  'film_id' => "#{film2.id}"
  })




binding.pry
nil
