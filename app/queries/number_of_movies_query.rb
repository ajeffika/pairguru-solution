# frozen_string_literal: true

module NumberOfMoviesQuery
  def initialize(genre_id)
    Genre.find(params[genre_id]).movies.count
  end
end
