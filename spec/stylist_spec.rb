require('spec_helper')

describe(Stylist) do
  describe('#name') do
    it('will return the name of the stylist') do
      test_stylist = Stylist.new({:name => "John", :id => nil})
      expect(test_stylist.name()).to(eq("John"))
  end
end

  describe('#id') do
    it('will return the id of the stylist') do
      test_stylist = Stylist.new({:name => "Jeff", :id => nil})
      expect(test_stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#save') do
    it("will save a stylist to the database") do
      test_stylist = Stylist.new({:name => "Michael", :id => nil})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
      end
    end

  describe('.all') do
    it('will return a list of all of the clients') do
      test_stylist = Stylist.new({:name => "Chris", :id => nil})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe('.find') do
    it('will find a specific stylist based on their id') do
      test_stylist = Stylist.new({:name => "Jennifer", :id => nil})
      test_stylist.save()
      expect(Stylist.find(test_stylist.id())).to(eq(test_stylist))
    end
  end

  describe('#clients') do
    it('will return a list of clients for a particular stylist') do
      test_stylist = Stylist.new({:name => "Bob", :id => nil})
      test_stylist.save()
      test_client = Client.new({:name => "Bill", :id => nil, :stylist_id => test_stylist.id()})
      test_client.save()
      test_client2 = Client.new({:name => "Brad", :id => nil, :stylist_id => test_stylist.id()})
      test_client2.save()
      expect(test_stylist.clients).to(eq([test_client, test_client2]))
    end
  end

  describe('#update') do
    it('lets you update the stylist in the database') do
      test_stylist = Stylist.new({:name => "Devon", :id => nil})
      test_stylist.save()
      test_stylist.update({:name => "Edward"})
      expect(test_stylist.name()).to(eq("Edward"))
    end
  end

  describe('#delete') do
    it('lets you delete a stylist from the database') do
      test_stylist = Stylist.new({:name => "Adam", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => "Brian", :id => nil})
      test_stylist2.save()
      test_stylist.delete()
      expect(Stylist.all()).to(eq([test_stylist2]))
    end
  end

end
