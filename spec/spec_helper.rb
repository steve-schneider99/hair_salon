require('rspec')
require('client')
require('stylist')
require('pg')

<<<<<<< HEAD
DB = PG.connect({:dbname => 'hair_salon_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM clients *;")
    DB.exec("DELETE FROM stylists *;")
  end
end
=======
# DB = PG.connect({:dbname => 'hair_salon_test'})
#
# RSpec.configure do |config|
#   config.after(:each) do
#     DB.exec("DELETE FROM clients *;")
#     DB.exec("DELETE FROM stylists *;")
#   end
# end
>>>>>>> 6e9c5fbdde099936478e8dfecaf4416908e6e215
