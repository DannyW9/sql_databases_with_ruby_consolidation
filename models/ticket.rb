require_relative('../db/sql_runner.rb')

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id, :screening_id

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @customer_id = details['customer_id'].to_i
    @film_id = details['film_id'].to_i
    @screening_id = details['screening_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id, screening_id)
            VALUES ($1, $2, $3)
            RETURNING id"
    values = [@customer_id, @film_id, @screening_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM tickets"
    results = SqlRunner.run(sql)
    return results.map{ |ticket| Ticket.new(ticket) }
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM tickets WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE tickets SET (customer_id, film_id, screening_id)
          = ($1, $2, $3)
          WHERE id = $4"
    values = [@customer_id, @film_id, @screening_id, @id]
    SqlRunner.run(sql, values)
  end

  def sell_ticket(film, screening)
    if film.customers_attending() > screening.max_allocation
      return "Full!"
    else
      save()
    end
  end

  # Change to allocation_check. Remove the else self.save()
  # insert the allocation_check into the .save() function before it runs
  # Need to add film/screening arguments to .save() ?
  # Another way to pull the film/screening details?




end
