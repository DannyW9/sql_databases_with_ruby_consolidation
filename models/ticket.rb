require_relative('../db/sql_runner.rb')

class Ticket

  attr_reader :id, :customer_id, :film_id

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @customer_id = details['customer_id'].to_i
    @film_id = details['film_id'].to_i
  end






end
