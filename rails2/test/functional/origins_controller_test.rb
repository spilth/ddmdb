require 'test_helper'

class OriginsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:origins)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_origin
    assert_difference('Origin.count') do
      post :create, :origin => { }
    end

    assert_redirected_to origin_path(assigns(:origin))
  end

  def test_should_show_origin
    get :show, :id => origins(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => origins(:one).id
    assert_response :success
  end

  def test_should_update_origin
    put :update, :id => origins(:one).id, :origin => { }
    assert_redirected_to origin_path(assigns(:origin))
  end

  def test_should_destroy_origin
    assert_difference('Origin.count', -1) do
      delete :destroy, :id => origins(:one).id
    end

    assert_redirected_to origins_path
  end
end
