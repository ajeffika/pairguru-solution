class MovieDevSerializer < ActiveModel::Serializer
  attributes :id, :title, :number_of_movies
  belongs_to :genre

  def number_of_movies
    NumberOfMoviesQuery.new(:genre_id).fetch
  end
end
