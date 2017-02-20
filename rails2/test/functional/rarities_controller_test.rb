require 'test_helper'

class RaritiesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:rarities)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_rarity
    assert_difference('Rarity.count') do
      post :create, :rarity => { }
    end

    assert_redirected_to rarity_path(assigns(:rarity))
  end

  def test_should_show_rarity
    get :show, :id => rarities(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => rarities(:one).id
    assert_response :success
  end

  def test_should_update_rarity
    put :update, :id => rarities(:one).id, :rarity => { }
    assert_redirected_to rarity_path(assigns(:rarity))
  end

  def test_should_destroy_rarity
    assert_difference('Rarity.count', -1) do
      delete :destroy, :id => rarities(:one).id
    end

    assert_redirected_to rarities_path
  end
end
