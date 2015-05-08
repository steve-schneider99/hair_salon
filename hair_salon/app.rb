require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
also_reload('lib/**/*.rb')
require('pg')
require('pry')

DB = PG.connect({:dbname => "hair_salon"})

get("/") do
  erb(:index)
end

get("/client_list") do
  @clients = Client.all()
  erb(:client_list)
end

post("/new_client") do
  name = params.fetch('name')
  Client.new({:name => name, :stylist_id => nil, :id => nil}).save()
  @clients = Client.all()
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
  @stylists = Stylist.all()
  erb(:stylist_list)
end

post("/new_stylist") do
  name = params.fetch('name')
  Stylist.new({:name => name, :id => nil}).save()
  @stylists = Stylist.all()
  erb(:stylist_list)
end

get("/stylist/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i)
  @clients = @stylist.clients()
  erb(:stylist_detail)
end

patch("/stylist/:id") do
  name = params.fetch("name")
  @stylist = Stylist.find(params.fetch("id").to_i)
  @stylist.update({:name => name})
  @clients = @stylist.clients()
  erb(:stylist_detail)
end

delete("/stylist/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i)
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:stylist_list)
end

delete("/client/:id") do
  @client = Client.find(params.fetch("id").to_i)
  @client.delete()
  @clients = Client.all()
  erb(:client_list)
end

post("/stylist/new_client") do
  stylist_id = params.fetch("stylist_id")
  name = params.fetch("client")
  Client.new({:name => name, :stylist_id => stylist_id, :id => nil}).save()
  @stylist = Stylist.find(stylist_id.to_i)
  @clients = @stylist.clients()
  erb(:stylist_detail)
end
