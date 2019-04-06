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
  
end
