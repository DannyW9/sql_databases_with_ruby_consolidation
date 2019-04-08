require_relative('../db/sql_runner.rb')

class Screening

  attr_reader :id
  attr_accessor :showing_time, :film_title, :max_allocation

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @showing_time = details['showing_time']
    @film_title = details['film_title']
    @max_allocation = details['max_allocation'].to_i
  end

  def save()
    sql = "INSERT INTO screenings (showing_time, film_title, max_allocation)
            VALUES ($1, $2, $3)
            RETURNING id"
    values = [@showing_time, @film_title, @max_allocation]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM screenings"
    results = SqlRunner.run(sql)
    return results.map{ |screening| Screening.new(screening) }
  end

  def self.delete_all()
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM screenings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE screenings SET (showing_time, film_title, max_allocation)
          = ($1, $2, $3)
          WHERE id = $4"
    values = [@showing_time, @film_title, @max_allocation, @id]
    SqlRunner.run(sql, values)
  end



end
