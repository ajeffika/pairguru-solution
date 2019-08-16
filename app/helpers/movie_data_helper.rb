module MovieDataHelper
  def fetch(movie)
      link_title = movie.title.parameterize( separator: '%20', preserve_case: true)
      url = "https://pairguru-api.herokuapp.com/api/v1/movies/#{link_title}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      JSON.parse(response)

  end

  def fetch_data(movie)
    if $redis.hgetall(movie.title) == {}
      x = fetch(movie)
      $redis.hmset(x['data']['attributes']['title'], 'rating', x['data']['attributes']['rating'],
                   'plot', x['data']['attributes']['plot'],
                   'poster', "https://pairguru-api.herokuapp.com#{x['data']['attributes']['poster']}")
      ### Expiry set to 60 secs just to demostrate
      $redis.expire(movie.title, 60)
    end
  end
end