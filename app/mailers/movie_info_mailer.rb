class MovieInfoMailer < ApplicationMailer
  def send_info(user, movie)
    @movie = movie
    user_json = user.as_json
    movie_json = movie.as_json
    MovieInfoWorker.perform_async(user_json,movie_json)
    mail(to: user.email, subject: "Info about movie #{movie.title}")
  end
end
