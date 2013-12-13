require 'spec_helper'

describe MiniaturesController do
  describe "#index" do
    it 'assigns all the miniatures' do
      get :index
      expect(assigns(:miniatures)).not_to be_nil
    end
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
        post :create, miniature: { name: 'Aberration' }
        expect(response).to redirect_to miniatures_path
      end

      it 'saves a new miniature' do
        Miniature.stub(:create) { Miniature.new }
        post :create, miniature: { name: 'Aberration' }
        expect(Miniature).to have_received(:create)
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
