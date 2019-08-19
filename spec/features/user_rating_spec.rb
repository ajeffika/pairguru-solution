require "rails_helper"
RSpec.describe 'movies', type: :query do

  FactoryBot.create(:user)
  FactoryBot.create(:movie)
  FactoryBot.create(:comment)

  feature 'rating shows on user/rating page' do
    it "visits user rating page" do
      visit rating_users_path
      expect(page).to have_css('#rating')
    end
  end
end

