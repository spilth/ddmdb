require 'spec_helper'

describe TypesController do
  describe "#new" do
    it 'assigns a new type' do
      get :new
      expect(assigns(:type)).not_to be_nil
    end
  end

  describe '#create' do
    context 'with valid data' do
      it 'redirects to the types index' do
        post :create, { name: 'Aberration' }
        expect(response).to redirect_to types_path
      end
    end
  end
end
