require('pg')
require_relative('../db/sql_runner.rb')

class Film

  attr_reader :id
  attr_accessor :title, :price

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

  def update()
    sql = "UPDATE films SET (title, price) = ($1, $2) WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM films WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON customers.id = tickets.customer_id WHERE tickets.film_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |customer| Customer.new(customer) }
  end

  def customer_numbers()
    sql = "SELECT COUNT(*) AS customer_numbers FROM tickets WHERE tickets.customer_id = $1"
    values = [@id]
    customer_numbers = SqlRunner.run(sql, values).first()
    return customer_numbers['customer_numbers'].to_i
  end

  def self.find(id)
    sql = "SELECT * FROM films WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    film_hash = results.first()
    film = Film.new(film_hash)
    return film
  end

  def self.all()
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    return films.map { |film| Film.new(film)}
  end

  def self.delete_all
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

end
