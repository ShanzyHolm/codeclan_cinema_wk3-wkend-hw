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
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id"
    values = [@title, @price]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

end
