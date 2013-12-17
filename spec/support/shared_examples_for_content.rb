shared_examples "a protected resource" do
  before do
    sign_in :user, create(:user)
  end

  describe "#new" do
    it 'redirects to the homepage' do
      get :new
      expect(response).to redirect_to root_path
    end
  end

  describe '#create' do
    it 'redirects to the homepage' do
      post :create, foo: { bar: '42' }
      expect(response).to redirect_to root_path
    end
  end

end
