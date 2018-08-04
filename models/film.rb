require('pg')
require_relative('../db/sql_runner.rb')

class Film

  attr_reader
  attr_accessor

  def initialize(options)
    @id = options['id'].to_i if options['if']
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO"
  end

end
