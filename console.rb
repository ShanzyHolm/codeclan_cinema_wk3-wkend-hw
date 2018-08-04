require('pry')
require_relative('models/customer.rb')
require_relative('models/film.rb')
require_relative('models/ticket.rb')

customer1 = Customer.new(
  {
    "name" => "Mickey Mouse",
    "funds" => "10"
  }
)
customer1.save()

customer2 = Customer.new(
  {
    "name" => "Minnie Mouse",
    "funds" => "15"
  }
)
customer2.save()

customer3 = Customer.new(
  {
    "name" => "Donald Duck",
    "funds" => "8"
  }
)
customer3.save()

customer4 = Customer.new(
  {
    "name" => "Daisy Duck",
    "funds" => "25"
  }
)
customer4.save()

customer5 = Customer.new(
  {
    "name" => "Goofy",
    "funds" => "2"
  }
)
customer5.save()

customer6 = Customer.new(
  {
    "name" => "Pluto",
    "funds" => "12"
  }
)
customer6.save()

film1 = Film.new(
  {
    "title" => "Titanic",
    "price" => "6"
  }
)
film1.save()

film2 = Film.new(
  {
    "title" => "Pixels",
    "price" => "4"
  }
)
film2.save()

film3 = Film.new(
  {
    "title" => "Gone with the Wind",
    "price" => "2"
  }
)
film3.save()

ticket1 = Ticket.new(
  {
    "customer_id" => customer1.id(),
    "film_id" => film2.id()
  }
)
ticket1.save()

binding.pry
nil
