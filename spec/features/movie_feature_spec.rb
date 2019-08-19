require "rails_helper"
RSpec.describe 'movies', type: :feature do

  let(:user) { create(:user) }
  let(:movie) { create(:movie) }
  let(:comment) { create(:comment) }
    before :each do
      sign_in user
    end
  feature 'user visits index page' do
    it "visits movie index page" do
      visit movies_path
      expect(page).to have_http_status(200)
    end
  end
  feature 'show' do
    it "visits movie show page" do

    visit movie_path(movie)
      expect(page).to have_http_status(200)
    end
  end

  feature 'comments' do

    it 'adding comment' do
      visit movie_path(movie)
      fill_in 'comment_body', with: 'some text'
      find("#submit_comment").click
      expect(page).to have_css('#comment', text: 'some text')
    end

    it 'destroying comment' do
      visit movie_path(movie)
      fill_in 'comment_body', with: 'some text'
      find("#submit_comment").click
      find("#delete_comment").click
      expect(page).not_to have_css('#comment')
    end
  end

end

