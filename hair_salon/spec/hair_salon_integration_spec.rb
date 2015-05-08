require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('going to the list of stylists and adding a new stylist', {:type => :feature}) do
  it('allows a user to see the list of stylists and add news ones') do
    visit('/')
    click_link('Click here to view the stylists')
    fill_in('name', :with => 'John')
    click_button('Add Stylist')
    expect(page).to have_content('John')
  end
end

describe('editing the name of a stylist', {:type => :feature}) do
  it('allows a user to edit an already existing stylist') do
    visit('/')
    click_link('Click here to view the stylists')
    fill_in('name', :with => 'John')
    click_button('Add Stylist')
    click_link('John')
    fill_in('name', :with => 'Mike')
    click_button('Update Stylist')
    expect(page).to have_content('Mike')
  end
end
