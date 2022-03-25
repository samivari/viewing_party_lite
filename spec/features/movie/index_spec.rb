require 'rails_helper'

RSpec.describe 'movie results page' do

  it 'button returns 40 movies with highest rating, desc order' do #, :vcr do
   # VCR.use_cassette() do

     user = User.create(name:'Max', email:'max@gmail.com')
     visit "/users/#{user.id}/discover"
     click_button 'Find Top Rated Movies'
     expect(current_path).to eq("/users/#{user.id}/movies")
     expect(page).to have_content("The Shawshank Redemption")
   # end
  end

  it 'can do partial searches for movies that meet params' do
    # VCR.use_cassette('') do

      user = User.create(name:'Max', email:'maw@fake.com')
      visit "/users/#{user.id}/discover"
      fill_in :keyword, with: 'The'
      click_on 'Search'
      expect(current_path).to eq("/users/#{user.id}/movies")
      expect(page).to have_content("The Batman")
    # end
  end
end
