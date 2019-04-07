require_relative('../db/sql_runner.rb')

class Screening

  attr_reader :id
  attr_accessor :showing_time, :film_title

def initialize(details)
  @id = details['id'].to_i if details['id']
  @showing_time = details['showing_time']
  @film_title = details['film_title']
end

end
