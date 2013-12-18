class UserMiniaturesController < ApplicationController
  def update
    counts = user_miniature_params
    counts.each do |id, count|
      record = UserMiniature.where(miniature_id: id, user_id: current_user.id).first_or_initialize
      binding.pry
      record.count = count
      record.save
    end

    redirect_to :back
  end

  private

  def user_miniature_params
    params.require(:count)
  end
end
