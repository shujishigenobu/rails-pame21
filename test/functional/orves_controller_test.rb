require 'test_helper'

class OrvesControllerTest < ActionController::TestCase
  setup do
    @orf = orves(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create orf" do
    assert_difference('Orf.count') do
      post :create, orf: { aaseq: @orf.aaseq, desc: @orf.desc, name: @orf.name, naseq: @orf.naseq }
    end

    assert_redirected_to orf_path(assigns(:orf))
  end

  test "should show orf" do
    get :show, id: @orf
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @orf
    assert_response :success
  end

  test "should update orf" do
    put :update, id: @orf, orf: { aaseq: @orf.aaseq, desc: @orf.desc, name: @orf.name, naseq: @orf.naseq }
    assert_redirected_to orf_path(assigns(:orf))
  end

  test "should destroy orf" do
    assert_difference('Orf.count', -1) do
      delete :destroy, id: @orf
    end

    assert_redirected_to orves_path
  end
end
