require 'spec_helper'

describe SizesController do
  it_behaves_like 'a protected resource'

  describe "#index" do
    it 'assigns all the sizes' do
      get :index
      expect(assigns(:sizes)).not_to be_nil
    end
  end

  context 'as an admin' do
    before do
      sign_in :user, create(:admin_user)
    end
    describe "#new" do
      it 'assigns a new size' do
        get :new
        expect(assigns(:size)).not_to be_nil
      end
    end

    describe '#create' do
      context 'with valid data' do
        it 'redirects to the sizes index' do
          post :create, size: { name: 'Medium', abbreviation: 'M' }
          expect(response).to redirect_to sizes_path
        end

        it 'saves a new size' do
          Size.stub(:create) { Size.new }
          post :create, size: { name: 'Medium', abbreviation: 'M' }
          expect(Size).to have_received(:create)
        end
      end
    end
  end

  describe '#show' do
    it 'loads the requested size' do
      Size.stub(:find) { Size.new }
      get :show, id: 1
      expect(Size).to have_received(:find).with("1")
    end
  end
end
