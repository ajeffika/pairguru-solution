module MovieDataHelper
  def fetch(movie)
      link_title = movie.title.parameterize( separator: '%20', preserve_case: true)
      url = "https://pairguru-api.herokuapp.com/api/v1/movies/#{link_title}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      JSON.parse(response, symbolize_names: true)

  end

  def fetch_data(movie)
    if $redis.hgetall(movie.title) == {}
      x = fetch(movie)
      if x == {message: "Couldn't find Movie"}
        $redis.hmset(movie.title,
                     'title', movie.title,
                     'description', movie.description,
                     'released_at', movie.released_at,
                     'genre', movie.genre )
      else
        $redis.hmset(x[:data][:attributes][:title],
                     'title', x[:data][:attributes][:title],
                     'rating', x[:data][:attributes][:rating],
                     'plot', x[:data][:attributes][:plot],
                     'poster', "https://pairguru-api.herokuapp.com#{x[:data][:attributes][:poster]}")
        ### Expiry set to 60 secs just to demostrate
        $redis.expire(movie.title, 60)
      end
    end
  end
end