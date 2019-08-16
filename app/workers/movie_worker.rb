class MovieWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(movie)
  end

end
