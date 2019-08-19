class Api::V2::MoviesController < ActionController::Base
  respond_to :json
  def index
    @movies = Movie.all
    render json: @movies, each_serializer: MovieDevSerializer
  end

  def show
    movie = Movie.find(params[:id])
    render json: movie, each_serializer: MovieDevSerializer
  end

end
