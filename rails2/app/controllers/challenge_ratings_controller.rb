class ChallengeRatingsController < ApplicationController
  sort "cr"
  list_mode "3"
  
  layout "main"
  
  def index
    # TODO: Figure out why 0.33 searches come up empty
    # TODO: Figure out URLs for fractional/decimal CRs
    #@challenge_ratings = [0.25, 0.33, 0.50] + (1..40).to_a
    @challenge_ratings = (1..40).to_a
  end

  def show
    @challenge_rating = params[:cr]
    if @challenge_rating
      @miniatures = Miniature.challenge_rating(@challenge_rating).sorted(get_sort_field(params[:sort], "cr")).with_include
    else
      redirect_to root_path
    end
  end
  
end
