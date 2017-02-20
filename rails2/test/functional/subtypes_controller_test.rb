require 'test_helper'

class SubtypesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:subtypes)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_subtype
    assert_difference('Subtype.count') do
      post :create, :subtype => { }
    end

    assert_redirected_to subtype_path(assigns(:subtype))
  end

  def test_should_show_subtype
    get :show, :id => subtypes(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => subtypes(:one).id
    assert_response :success
  end

  def test_should_update_subtype
    put :update, :id => subtypes(:one).id, :subtype => { }
    assert_redirected_to subtype_path(assigns(:subtype))
  end

  def test_should_destroy_subtype
    assert_difference('Subtype.count', -1) do
      delete :destroy, :id => subtypes(:one).id
    end

    assert_redirected_to subtypes_path
  end
end
