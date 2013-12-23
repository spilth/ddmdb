require 'spec_helper'

describe UserMiniaturesController do
  context 'when signed in' do
    describe '#update' do
      before do
        user = create(:user)
        sign_in user
        request.env['HTTP_REFERER'] = 'where_i_came_from'
      end

      it 'redirects to the homepage' do
        put :update, 'count'=>{'1'=>'42'}
        expect(response).to redirect_to 'where_i_came_from'
      end

      it 'sets a flash message' do
        put :update, 'count'=>{'1'=>'42'}
        expect(flash[:notice]).to eq 'Your collection has been updated.'

      end
    end
  end

  context 'when not signed in' do
    describe '#update' do
      it 'redirects to the homepage' do
        put :update, 'count'=>{'1'=>'42'}
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

end
