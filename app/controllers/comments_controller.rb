class CommentsController < ApplicationController

  def create
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.create(comment_params)
    @comment.user_id = current_user.id
    unless @comment.save
      flash[:alert] = "Your commment could not be saved. Please make sure to submit valid input only!"
    end
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.find(params[:id])
    @comment.destroy
    redirect_to movie_path(@movie)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
