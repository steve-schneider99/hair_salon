class Stylist
attr_reader(:name, :id)


define_method(:initialize) do |attributes|
  @name = attributes.fetch(:name)
  @id = attributes.fetch(:id).to_i()
end

define_method(:save) do
  result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id")
  @id = result.first().fetch("id").to_i()
end

define_singleton_method(:all) do
  all_stylists = DB.exec("SELECT * FROM stylists")
  result = []
  all_stylists.each() do |stylist|
    name = stylist.fetch('name')
    id_number = stylist.fetch("id").to_i
    result.push(Stylist.new({:name => name, :id => id_number,}))
  end
  result
end

define_singleton_method(:find) do |id|
  found_stylist = nil
  all_stylists = Stylist.all()
  all_stylists.each() do |stylist|
    stylist.id().to_i() == id
    found_stylist = stylist
  end
  found_stylist
end

define_method(:==) do |other_stylist|
  self.name() == other_stylist.name() && self.id() == other_stylist.id()
end

define_method(:clients) do
   list_clients =[]
   clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()}")
   clients.each() do |client|
     name = task.fetch('name')
     stylist_id = client.fetch('stylist_id').to_i()
     id = client.fetch('id').to_i()
     list_clients.push(Client.new({:name => name, :id => id, :stylist_id => stylist_id}))
     end
     list_clients
   end

   define_method(:update) do |attributes|
     @name = attributes.fetch(:name)
     @id = attributes.fetch(:id).to_i
     DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id};")
   end

   define_method(:delete) do
     DB.exec("DELETE FROM stylists WHERE id = #{self.id()};")
   end

end
