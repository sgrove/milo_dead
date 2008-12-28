require 'test_helper'

class PhrasesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:phrases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create phrase" do
    assert_difference('Phrase.count') do
      post :create, :phrase => { }
    end

    assert_redirected_to phrase_path(assigns(:phrase))
  end

  test "should show phrase" do
    get :show, :id => phrases(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => phrases(:one).id
    assert_response :success
  end

  test "should update phrase" do
    put :update, :id => phrases(:one).id, :phrase => { }
    assert_redirected_to phrase_path(assigns(:phrase))
  end

  test "should destroy phrase" do
    assert_difference('Phrase.count', -1) do
      delete :destroy, :id => phrases(:one).id
    end

    assert_redirected_to phrases_path
  end
end
