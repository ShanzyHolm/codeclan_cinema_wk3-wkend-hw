require('pg')
require_relative('../db/sql_runner')

class Ticket

  attr_reader
  attr_accessor

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()

  end

end
