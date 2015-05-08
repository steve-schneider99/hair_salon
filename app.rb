require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
also_reload('lib/**/*.rb')
require('pg')

# DB = PG.connect({:dbname => "hair_salon"})

get("/") do
  erb(:index)
end

get("/client_list") do
  @clients = []
  erb(:client_list)
end

post("/new_client") do
  name = params.fetch('name')
  Client.new({:name => name, :stylist_id => nil, :id => nil}).save()
  @clients = []
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
  @stylists = []
  erb(:stylist_list)
end

post("/new_stylist") do
  name = params.fetch('name')
  Stylist.new({:name => name, :id => nil})
  @stylists = []
  erb(:stylist_list)
end
