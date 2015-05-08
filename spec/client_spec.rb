require('spec_helper')

describe(Client) do
  describe('#name') do
    it('will return the name of the client') do
      test_client = Client.new({:name => "John", :id => nil})
      expect(test_client.name()).to(eq("John"))
  end
end

  describe('#id') do
    it('will return the id of the client') do
      test_client = Client.new({:name => "Jeff", :id => nil})
      expect(test_client.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#save') do
    it("will save a client to the database") do
      test_client = Client.new({:name => "Michael", :id => nil})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
      end
    end

  describe('.all') do
    it('will return a list of all of the clients') do
      test_client = Client.new({:name => "Chris", :id => nil})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe('.find') do
    it('will find a specific client based on their id') do
      test_client = Client.new({:name => "Jennifer", :id => nil})
      test_client.save()
      expect(Client.find(test_client.id())).to(eq(test_client))
    end
  end

end
