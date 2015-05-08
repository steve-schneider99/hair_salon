class Client
attr_reader(:name, :id, :stylist_id)


define_method(:initialize) do |attributes|
  @name = attributes.fetch(:name)
  @id = attributes.fetch(:id).to_i()
  @stylist_id = attributes.fetch(:stylist_id).to_i
end

define_method(:save) do
  result = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', '#{@stylist_id}') RETURNING id")
  @id = result.first().fetch("id").to_i()
end

define_singleton_method(:all) do
  all_clients = DB.exec("SELECT * FROM clients")
  result = []
  all_clients.each() do |client|
    name = client.fetch('name')
    id_number = client.fetch("id").to_i
    stylist_id = client.fetch("stylist_id").to_i
    result.push(Client.new({:name => name, :id => id_number, :stylist_id => nil}))
  end
  result
end

define_singleton_method(:find) do |id|
  found_client = nil
  all_clients = Client.all()
  all_clients.each() do |client|
    client.id().to_i() == id
    found_client = client
  end
  found_client
end

define_method(:==) do |other_client|
  self.name() == other_client.name() && self.id() == other_client.id()
end

define_method(:update) do |attributes|
  @name = attributes.fetch(:name)
  @stylist_id = attributes.fetch(:stylist_id).to_i
  @id = attributes.fetch(:id).to_i
  DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{@id};")
end

define_method(:delete) do
  DB.exec("DELETE FROM clients WHERE id = #{self.id()};")
end
