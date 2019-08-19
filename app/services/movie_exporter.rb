require "csv"

class MovieExporter
  def call(user, file_path)
    user_json = user.as_json
    MovieExportWorker.perform_async(user_json,file_path)
  end


end
