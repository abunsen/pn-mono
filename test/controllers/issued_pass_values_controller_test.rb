require "test_helper"

class IssuedPassValuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @issued_pass_value = issued_pass_values(:one)
  end

  test "should get index" do
    get issued_pass_values_url
    assert_response :success
  end

  test "should get new" do
    get new_issued_pass_value_url
    assert_response :success
  end

  test "should create issued_pass_value" do
    assert_difference("IssuedPassValue.count") do
      post issued_pass_values_url, params: { issued_pass_value: { issued_pass_id: @issued_pass_value.issued_pass_id, path: @issued_pass_value.path, value: @issued_pass_value.value } }
    end

    assert_redirected_to issued_pass_value_url(IssuedPassValue.last)
  end

  test "should show issued_pass_value" do
    get issued_pass_value_url(@issued_pass_value)
    assert_response :success
  end

  test "should get edit" do
    get edit_issued_pass_value_url(@issued_pass_value)
    assert_response :success
  end

  test "should update issued_pass_value" do
    patch issued_pass_value_url(@issued_pass_value), params: { issued_pass_value: { issued_pass_id: @issued_pass_value.issued_pass_id, path: @issued_pass_value.path, value: @issued_pass_value.value } }
    assert_redirected_to issued_pass_value_url(@issued_pass_value)
  end

  test "should destroy issued_pass_value" do
    assert_difference("IssuedPassValue.count", -1) do
      delete issued_pass_value_url(@issued_pass_value)
    end

    assert_redirected_to issued_pass_values_url
  end
end
