require('pry-byebug')
require_relative('models/film.rb')

film1 = Film.new({
  'title' => 'John Wick: Chapter 3',
  'price' => '10'
  })

film2 = Film.new({
  'title' => 'The Lion King',
  'price' => '15'
  })

film3 = Film.new({
  'title' => 'Avengers: Endgame',
  'price' => '12'
  })




binding.pry
nil
