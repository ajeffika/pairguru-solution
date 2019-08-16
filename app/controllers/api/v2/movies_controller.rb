class Api::V2::MoviesController < ActionController::Base
  respond_to :json

  def index
    @movies = Movie.all
    render json: @movies, each_serializer: MovieDevSerializer
  end

  def show
    movies = Movie.find(params[:id])
    render json: movies, each_serializer: MovieDevSerializer
  end

  def number_of_movies
    @number_of_movies = Genre.find(params[:genre_id]).movies.count
    render json: @number_of_movies, each_serializer: MovieDevSerializer

  end
end
