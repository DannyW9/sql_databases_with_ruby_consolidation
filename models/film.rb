require_relative('../db/sql_runner.rb')

class Film

  attr_reader :id, :title, :price

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @title = details['title']
    @price = details['price'].to_i
  end



end
