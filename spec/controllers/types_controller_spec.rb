require 'spec_helper'

describe TypesController do
  it_behaves_like 'a protected resource'

  describe "#index" do
    it 'assigns all the types' do
      get :index
      expect(assigns(:types)).not_to be_nil
    end
  end

  context 'as an admin' do
    before do
      sign_in :user, create(:admin_user)
    end

    describe "#new" do
      it 'assigns a new type' do
        get :new
        expect(assigns(:type)).not_to be_nil
      end
    end

    describe '#create' do
      context 'with valid data' do
        it 'redirects to the types index' do
          post :create, type: { name: 'Aberration' }
          expect(response).to redirect_to types_path
        end

        it 'saves a new type' do
          Type.stub(:create) { Type.new }
          post :create, type: { name: 'Aberration' }
          expect(Type).to have_received(:create)
        end
      end
    end
  end

  describe '#show' do
    it 'loads the requested type' do
      Type.stub(:find) { Type.new }
      get :show, id: 1
      expect(Type).to have_received(:find).with("1")
    end
  end
end
