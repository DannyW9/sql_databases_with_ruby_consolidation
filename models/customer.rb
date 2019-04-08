require_relative('../db/sql_runner.rb')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
    @funds = details['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds)
            VALUES ($1, $2)
            RETURNING id"
    values = [@name, @funds]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM customers"
    results = SqlRunner.run(sql)
    return results.map{ |customer| Customer.new(customer) }
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE customers SET (name, funds)
            = ($1, $2)
            WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.*  FROM films
    INNER JOIN tickets ON films.id = tickets.film_id
    WHERE tickets.customer_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{ |film| Film.new(film) }
  end

  def update_funds()
    # first, find the total price of tickets bought
    sql = "SELECT SUM(films.price) FROM films
    INNER JOIN tickets ON films.id = tickets.film_id
    WHERE tickets.customer_id = $1"
    values = [@id]
    total_price = SqlRunner.run(sql, values)[0]['sum'].to_i

    #second, remove the total price from the customer funds
    @funds -= total_price

    #third, update customer funds in database
    self.update()
    #Better to do without Sql?
    #SELECT films.price.....
    #loop through array of returned prices and total them
  end

  def number_of_tickets()
    sql = "SELECT COUNT(films.*) FROM films
    INNER JOIN tickets ON films.id = tickets.film_id
    WHERE tickets.customer_id = $1"
    values = [@id]
    tickets = SqlRunner.run(sql, values)[0]['count'].to_i
    return tickets
    #Again, better to do without Sql?
    #Use method for returning films.
    #Add .length/count to the resulting array?
  end

  def number_of_tickets_2()
    result = self.films()
    result.length()
  end


end
