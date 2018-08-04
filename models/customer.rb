require('pg')
require_relative('..db/sql_runner.rb')

class Customer

  attr_reader
  attr_accessor

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()

  end

end
