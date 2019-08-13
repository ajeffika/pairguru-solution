module MovieDataHelper
  def fetch(movie)
    link_title = movie.title.parameterize( separator: '%20', preserve_case: true)
    url = "https://pairguru-api.herokuapp.com/api/v1/movies/#{link_title}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)

  end

  def fetch_data(movie)
    data = fetch(movie)
     { rating: data['data']['attributes']['rating'],
       plot: data['data']['attributes']['plot'],
       poster: "https://pairguru-api.herokuapp.com#{data['data']['attributes']['poster']}" }
  end
end