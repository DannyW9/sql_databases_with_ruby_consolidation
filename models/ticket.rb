require_relative('../db/sql_runner.rb')

class Ticket

  attr_reader :id, :customer_id, :film_id

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @customer_id = details['customer_id'].to_i
    @film_id = details['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id)
            VALUES ($1, $2)
            RETURNING id"
    values = [@customer_id, @film_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    results = SqlRunner.run(sql)
    return results.map{ |ticket| Ticket.new(ticket) }
  end





end
