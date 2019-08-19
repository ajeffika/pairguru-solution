class MovieInfoWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(user,movie)
    @movie = movie
    sleep(3) # this emulates long email sending, do not remove
  end

end
