require 'spec_helper'

describe SubtypesController do
  it_behaves_like 'a protected resource'

  describe "#index" do
    it 'assigns all the subtypes' do
      get :index
      expect(assigns(:subtypes)).not_to be_nil
    end
  end

  context 'as an admin' do
    before do
      sign_in :user, create(:admin_user)
    end

    describe "#new" do
      it 'assigns a new subtype' do
        get :new
        expect(assigns(:subtype)).not_to be_nil
      end
    end

    describe '#create' do
      context 'with valid data' do
        it 'redirects to the subtypes index' do
          post :create, subtype: { name: 'Dwarf' }
          expect(response).to redirect_to subtypes_path
        end

        it 'saves a new subtype' do
          Subtype.stub(:create) { Subtype.new }
          post :create, subtype: { name: 'Dwarf' }
          expect(Subtype).to have_received(:create)
        end
      end
    end
  end

  describe '#show' do
    it 'loads the requested subtype' do
      Subtype.stub(:find) { Subtype.new }
      get :show, id: 1
      expect(Subtype).to have_received(:find).with("1")
    end
  end
end
