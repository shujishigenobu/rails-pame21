require 'test_helper'

class OrfModelsControllerTest < ActionController::TestCase
  setup do
    @orf_model = orf_models(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orf_models)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create orf_model" do
    assert_difference('OrfModel.count') do
      post :create, orf_model: { aaseq: @orf_model.aaseq, desc: @orf_model.desc, name: @orf_model.name, naseq: @orf_model.naseq }
    end

    assert_redirected_to orf_model_path(assigns(:orf_model))
  end

  test "should show orf_model" do
    get :show, id: @orf_model
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @orf_model
    assert_response :success
  end

  test "should update orf_model" do
    put :update, id: @orf_model, orf_model: { aaseq: @orf_model.aaseq, desc: @orf_model.desc, name: @orf_model.name, naseq: @orf_model.naseq }
    assert_redirected_to orf_model_path(assigns(:orf_model))
  end

  test "should destroy orf_model" do
    assert_difference('OrfModel.count', -1) do
      delete :destroy, id: @orf_model
    end

    assert_redirected_to orf_models_path
  end
end
