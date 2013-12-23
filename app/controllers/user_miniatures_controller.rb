class UserMiniaturesController < ApplicationController
  before_filter :authenticate_user!, only: [:update]

  def update
    counts = user_miniature_params
    counts.each do |id, count|
      record = UserMiniature.where(miniature_id: id, user_id: current_user.id).first_or_initialize
      record.count = count
      record.save
    end

    flash[:notice] = 'Your collection has been updated.'
    redirect_to :back
  end

  private

  def user_miniature_params
    params.require(:count)
  end
end
