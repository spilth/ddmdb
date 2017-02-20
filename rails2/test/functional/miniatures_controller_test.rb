require 'test_helper'

class MiniaturesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:miniatures)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_miniature
    assert_difference('Miniature.count') do
      post :create, :miniature => { }
    end

    assert_redirected_to miniature_path(assigns(:miniature))
  end

  def test_should_show_miniature
    get :show, :id => miniatures(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => miniatures(:one).id
    assert_response :success
  end

  def test_should_update_miniature
    put :update, :id => miniatures(:one).id, :miniature => { }
    assert_redirected_to miniature_path(assigns(:miniature))
  end

  def test_should_destroy_miniature
    assert_difference('Miniature.count', -1) do
      delete :destroy, :id => miniatures(:one).id
    end

    assert_redirected_to miniatures_path
  end
end
