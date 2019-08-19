class Api::V1::MoviesController < ActionController::Base
  respond_to :json

  def index
    @movies = Movie.all
    render json: @movies
  end

  def show
    movies = Movie.find(params[:id])
    render json: movies
  end

end
