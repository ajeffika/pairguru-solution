class UsersController < ApplicationController

  def rating
    @users = User.joins(:comments)
                 .group(:id)
                 .where("comments.created_at > ?", 7.days.ago)
                 .order(Arel.sql("COUNT(comments.id) DESC"))
                 .limit(10)
  end
end