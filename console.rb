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
    "price" => "5"
  }
)
film1.save()

film2 = Film.new(
  {
    "title" => "Pixels",
    "price" => "3"
  }
)
film2.save()

film3 = Film.new(
  {
    "title" => "Gone with the Wind",
    "price" => "1"
  }
)
film3.save()

film4 = Film.new(
  {
    "title" => "Matilda",
    "price" => "2"
  }
)
film4.save()

film5 = Film.new(
  {
    "title" => "Frozen",
    "price" => "4"
  }
)
film5.save()


ticket1 = Ticket.new({"customer_id" => customer1.id(), "film_id" => film2.id()})
ticket1.save()

ticket2 = Ticket.new({"customer_id" => customer5.id(), "film_id" => film4.id()})
ticket2.save()

ticket3 = Ticket.new({"customer_id" => customer3.id(), "film_id" => film1.id()})
ticket3.save()

ticket4 = Ticket.new({"customer_id" => customer4.id(), "film_id" => film3.id()})
ticket4.save()

ticket5 = Ticket.new({"customer_id" => customer2.id(), "film_id" => film1.id()})
ticket5.save()

ticket6 = Ticket.new({"customer_id" => customer5.id(), "film_id" => film5.id()})
ticket6.save()

ticket7 = Ticket.new({"customer_id" => customer2.id(), "film_id" => film2.id()})
ticket7.save()

ticket8 = Ticket.new({"customer_id" => customer3.id(), "film_id" => film3.id()})
ticket8.save()

ticket9 = Ticket.new({"customer_id" => customer4.id(), "film_id" => film1.id()})
ticket9.save()

ticket10 = Ticket.new({"customer_id" => customer1.id(), "film_id" => film1.id()})
ticket10.save()

ticket11 = Ticket.new({"customer_id" => customer4.id(), "film_id" => film2.id()})
ticket11.save()

ticket12 = Ticket.new({"customer_id" => customer4.id(), "film_id" => film5.id()})
ticket12.save()

ticket13 = Ticket.new({"customer_id" => customer3.id(), "film_id" => film4.id()})
ticket13.save()

binding.pry
nil
