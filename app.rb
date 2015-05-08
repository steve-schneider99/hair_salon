require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
also_reload('lib/**/*.rb')
require('pg')

<<<<<<< HEAD
DB = PG.connect({:dbname => "hair_salon"})
=======
# DB = PG.connect({:dbname => "hair_salon"})
>>>>>>> 6e9c5fbdde099936478e8dfecaf4416908e6e215

get("/") do
  erb(:index)
end

get("/client_list") do
<<<<<<< HEAD
  @clients = Client.all()
=======
  @clients = []
>>>>>>> 6e9c5fbdde099936478e8dfecaf4416908e6e215
  erb(:client_list)
end

post("/new_client") do
  name = params.fetch('name')
  Client.new({:name => name, :stylist_id => nil, :id => nil}).save()
<<<<<<< HEAD
  @clients = Client.all()
=======
  @clients = []
>>>>>>> 6e9c5fbdde099936478e8dfecaf4416908e6e215
  erb(:client_list)
end

get("/client/:id") do
  @client = Client.find(params.fetch("id").to_i)
  erb(:client_detail)
end

patch("/client/:id") do
  name = params.fetch("name")
  @client = Client.find(params.fetch("id").to_i)
  @client.update({:name => name})
  erb(:client_detail)
end

get("/stylist_list") do
<<<<<<< HEAD
  @stylists = Stylist.all()
=======
  @stylists = []
>>>>>>> 6e9c5fbdde099936478e8dfecaf4416908e6e215
  erb(:stylist_list)
end

post("/new_stylist") do
  name = params.fetch('name')
<<<<<<< HEAD
  Stylist.new({:name => name, :id => nil}).save()
  @stylists = Stylist.all()
=======
  Stylist.new({:name => name, :id => nil})
  @stylists = []
>>>>>>> 6e9c5fbdde099936478e8dfecaf4416908e6e215
  erb(:stylist_list)
end

get("/stylist/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i)
<<<<<<< HEAD
  @clients = @stylist.clients
=======
>>>>>>> 6e9c5fbdde099936478e8dfecaf4416908e6e215
  erb(:stylist_detail)
end

patch("stylist/:id") do
  name = params.fetch("name")
  @stylist = Stylist.find(params.fetch("id").to_i)
  @stylist.update({:name => name})
  erb(:stylist_detail)
end
<<<<<<< HEAD

delete("stylist/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i)
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:stylist_list)
end

delete("client/:id") do
  @client = Client.find(params.fetch("id").to_i)
  @client.delete()
  @clients = Client.all()
  erb(:client_list)
end
=======
>>>>>>> 6e9c5fbdde099936478e8dfecaf4416908e6e215
