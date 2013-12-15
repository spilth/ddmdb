require 'spec_helper'

describe RaritiesController do
  describe "#index" do
    it 'assigns all the rarities' do
      get :index
      expect(assigns(:rarities)).not_to be_nil
    end
  end

  describe "#new" do
    it 'assigns a new rarity' do
      get :new
      expect(assigns(:rarity)).not_to be_nil
    end
  end

  describe '#create' do
    context 'with valid data' do
      it 'redirects to the rarities index' do
        post :create, rarity: { name: 'Medium', abbreviation: 'M' }
        expect(response).to redirect_to rarities_path
      end

      it 'saves a new rarity' do
        Rarity.stub(:create) { Rarity.new }
        post :create, rarity: { name: 'Medium', abbreviation: 'M' }
        expect(Rarity).to have_received(:create)
      end
    end
  end

  describe '#show' do
    it 'loads the requested rarity' do
      Rarity.stub(:find) { Rarity.new }
      get :show, id: 1
      expect(Rarity).to have_received(:find).with("1")
    end
  end
end
