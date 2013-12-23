require 'test_helper'

class SizesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:sizes)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_size
    assert_difference('Size.count') do
      post :create, :size => { }
    end

    assert_redirected_to size_path(assigns(:size))
  end

  def test_should_show_size
    get :show, :id => sizes(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => sizes(:one).id
    assert_response :success
  end

  def test_should_update_size
    put :update, :id => sizes(:one).id, :size => { }
    assert_redirected_to size_path(assigns(:size))
  end

  def test_should_destroy_size
    assert_difference('Size.count', -1) do
      delete :destroy, :id => sizes(:one).id
    end

    assert_redirected_to sizes_path
  end
end
