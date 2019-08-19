require 'rails_helper'
RSpec.describe Api::V2::MoviesController do  describe "GET #index" do
  before :each do
    FactoryBot.create(:movie)
    get api_v2_movies_path
  end
  it "returns http success" do
    expect(response).to have_http_status(:success)
  end
  it "JSON body response contains expected movie attributes" do
    json_response = JSON.parse(response.body, symbolize_names: true)
    json_response.each do |hash|
      expect(hash.keys).to contain_exactly(:id, :title, :movies_in_genre, :genre)
    end
  end
end
end

