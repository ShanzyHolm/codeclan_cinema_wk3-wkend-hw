require('pg')
require_relative('../db/sql_runner.rb')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
    values = [@name, @funds]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE tickets.customer_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |film| Film.new(film) }
  end

  def number_of_tickets()
    sql = "SELECT COUNT(*) AS number_of_tickets_bought FROM tickets WHERE tickets.customer_id = $1"
    values = [@id]
    number_of_tickets_bought = SqlRunner.run(sql, values).first()
    return number_of_tickets_bought['number_of_tickets_bought'].to_i
  end

  def funds()
    sql = "SELECT customers.funds FROM customers WHERE id = $1"
    values = [id]
    funds = SqlRunner.run(sql, values).first()
    return funds['funds'].to_i
  end

  def buy_ticket()
    sql = "SELECT customers.funds FROM customers WHERE id = $1; SELECT films.price WHERE films INNER JOIN tickets ON films.id = tickets.film_id WHERE tickets.film_id = $2; SUM(customers.funds) - films.price) AS updated_funds"
    values = [id, @films.price]
    updated_funds = SqlRunner.run(sql, values).first()
    return updated_funds["updated_funds"].to_i
  end



  # def buy_ticket()
  #   sql1 = "SELECT customers.funds FROM customers WHERE id = $1"
  #   values1 = [id]
  #   funds = SqlRunner.run(sql1, values1).first()
  #   sql2 = "SELECT films.price WHERE films INNER JOIN tickets ON films.id = tickets.film_id WHERE tickets.film_id = $2"
  #   values = [@id]
  #   ticket_price = SqlRunner.run(sql2).first()
  #   return funds['funds'].to_i - ticket_price['price'].to_i
  # end

  # (SUM(master_table.QTY) - stock_bal.BAL_QTY) AS NEW_BAL
  # FROM STACKOVERFLOW

#   SELECT COUNT(aggregate_expression)
# FROM tables
# [WHERE conditions]
# [ORDER BY expression [ ASC | DESC ]];
# Code explanation found on https://www.techonthenet.com/sql/count.php

  def self.find(id)
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    customer_hash = results.first()
    customer = Customer.new(customer_hash)
    return customer
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    return customers.map { |customer| Customer.new(customer)}
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

end
