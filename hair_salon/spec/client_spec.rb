require('spec_helper')

describe(Client) do
  describe('#name') do
    it('will return the name of the client') do
      test_client = Client.new({:name => "John", :id => nil, :stylist_id => nil})
      expect(test_client.name()).to(eq("John"))
  end
end

  describe('#id') do
    it('will return the id of the client') do
      test_client = Client.new({:name => "Jeff", :id => nil, :stylist_id => nil})
      expect(test_client.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#stylist_id') do
    it('will return the stylist id of the client') do
      test_client = Client.new({:name => "Jeff", :id => nil, :stylist_id => nil})
      expect(test_client.stylist_id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#save') do
    it("will save a client to the database") do
      test_client = Client.new({:name => "Michael", :id => nil, :stylist_id => nil})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
      end
    end

  describe('.all') do
    it('will return a list of all of the clients') do
      test_client = Client.new({:name => "Chris", :id => nil, :stylist_id => nil})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe('.find') do
    it('will find a specific client based on their id') do
      test_client = Client.new({:name => "Jennifer", :id => nil, :stylist_id => nil})
      test_client.save()
      expect(Client.find(test_client.id())).to(eq(test_client))
    end
  end

  describe('#update') do
    it('lets you update the client in the database') do
      test_client = Client.new({:name => "Jeremy", :stylist_id => nil, :id => nil})
      test_client.save()
      test_client.update({:name => "Cody"})
      expect(test_client.name()).to(eq("Cody"))
    end
  end

  describe('#delete') do
    it('lets you delete a client from the database') do
      test_client = Client.new({:name => "Adam", :stylist_id => nil, :id => nil})
      test_client.save()
      test_client2 = Client.new({:name => "Brian", :stylist_id => nil, :id => nil})
      test_client2.save()
      test_client.delete()
      expect(Client.all()).to(eq([test_client2]))
    end
  end

end
