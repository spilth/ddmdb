require 'test_helper'

class DifficultiesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:difficulties)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_difficulty
    assert_difference('Difficulty.count') do
      post :create, :difficulty => { }
    end

    assert_redirected_to difficulty_path(assigns(:difficulty))
  end

  def test_should_show_difficulty
    get :show, :id => difficulties(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => difficulties(:one).id
    assert_response :success
  end

  def test_should_update_difficulty
    put :update, :id => difficulties(:one).id, :difficulty => { }
    assert_redirected_to difficulty_path(assigns(:difficulty))
  end

  def test_should_destroy_difficulty
    assert_difference('Difficulty.count', -1) do
      delete :destroy, :id => difficulties(:one).id
    end

    assert_redirected_to difficulties_path
  end
end
