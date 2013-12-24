require 'spec_helper'

describe MiniaturesController do
  it_behaves_like 'a protected resource'

  describe "#index" do
    it 'assigns all the miniatures' do
      get :index
      expect(assigns(:miniatures)).not_to be_nil
    end
  end

  context 'as a user' do
    before do
      sign_in :user, create(:user)
    end

    describe '#update' do
      it 'redirects to the miniature you were viewing' do
        miniature = create(:miniature)
        post :update, id: miniature.id, miniature: {name: 'New Name'}
        expect(response).to redirect_to miniature_path(miniature)
      end

      it 'sets the flash message' do
        miniature = create(:miniature)
        post :update, id: miniature.id, miniature: {name: 'New Name'}

        expect(flash[:notice]).to eq 'This miniature has been update.'
      end
    end
  end

  context 'as an admin' do
    before do
      sign_in :user, create(:admin_user)
    end

    describe "#new" do
      it 'assigns a new miniature' do
        get :new
        expect(assigns(:miniature)).not_to be_nil
      end
    end

    describe '#create' do
      context 'with valid data' do
        it 'redirects to the miniatures index' do
          post :create, miniature: { name: 'Cleric of Order', type_id: 1, subtype_id: 1 }
          expect(response).to redirect_to miniatures_path
        end

        it 'saves a new miniature' do
          Miniature.stub(:create) { Miniature.new }
          post :create, miniature: { name: 'Cleric of Order', type_id: 1, subtype_id: 1 }
          expect(Miniature).to have_received(:create)
        end
      end
    end
  end

  describe '#show' do
    it 'loads the requested miniature' do
      Miniature.stub(:find) { Miniature.new }
      get :show, id: 1
      expect(Miniature).to have_received(:find).with("1")
    end
  end
end
