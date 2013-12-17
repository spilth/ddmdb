require 'spec_helper'

describe ReleasesController do
  it_behaves_like 'a protected resource'

  describe "#index" do
    it 'assigns all the releases' do
      get :index
      expect(assigns(:releases)).not_to be_nil
    end
  end

  context 'as an admin' do
    before do
      sign_in :user, create(:admin_user)
    end
    describe "#new" do
      it 'assigns a new release' do
        get :new
        expect(assigns(:release)).not_to be_nil
      end
    end

    describe '#create' do
      context 'with valid data' do
        it 'redirects to the releases index' do
          post :create, release: { name: 'Harbinger', abbreviation: 'Ha', count: 80 }
          expect(response).to redirect_to releases_path
        end

        it 'saves a new release' do
          Release.stub(:create) { Release.new }
          post :create, release: { name: 'Harbinger', abbreviation: 'Ha', count: 80 }
          expect(Release).to have_received(:create)
        end
      end
    end
  end

  describe '#show' do
    it 'loads the requested release' do
      Release.stub(:find) { Release.new }
      get :show, id: 1
      expect(Release).to have_received(:find).with("1")
    end
  end
end
