class MovieDevSerializer < ActiveModel::Serializer
  attributes :id, :title, :movies_in_genre
  belongs_to :genre

  def movies_in_genre
    Genre.find(object.genre.id).movies.count
  end

  def genre
    { id: object.genre.id, name: object.genre.name }
  end
end
