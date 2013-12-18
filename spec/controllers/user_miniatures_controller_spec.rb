require 'spec_helper'

describe UserMiniaturesController do
  describe '#update' do
    it 'redirects to the homepage' do
      request.env["HTTP_REFERER"] = 'where_i_came_from'
      put :update, 'count'=>{'1'=>'42'}
      expect(response).to redirect_to 'where_i_came_from'
    end

    it "updates a user's miniature counts" do
      put :update, 'count'=>{'1'=>'42'}
    end
  end

end
