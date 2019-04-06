require('pry-byebug')
require_relative('models/film.rb')
require_relative('models/customer.rb')

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


# film1.price = '1000'
# film1.update()


binding.pry
nil
