require "test_helper"

class PassTemplateFieldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pass_template_field = pass_template_fields(:one)
  end

  test "should get index" do
    get pass_template_fields_url
    assert_response :success
  end

  test "should get new" do
    get new_pass_template_field_url
    assert_response :success
  end

  test "should create pass_template_field" do
    assert_difference("PassTemplateField.count") do
      post pass_template_fields_url, params: { pass_template_field: { default_value: @pass_template_field.default_value, description: @pass_template_field.description, name: @pass_template_field.name, pass_template_id: @pass_template_field.pass_template_id, path: @pass_template_field.path } }
    end

    assert_redirected_to pass_template_field_url(PassTemplateField.last)
  end

  test "should show pass_template_field" do
    get pass_template_field_url(@pass_template_field)
    assert_response :success
  end

  test "should get edit" do
    get edit_pass_template_field_url(@pass_template_field)
    assert_response :success
  end

  test "should update pass_template_field" do
    patch pass_template_field_url(@pass_template_field), params: { pass_template_field: { default_value: @pass_template_field.default_value, description: @pass_template_field.description, name: @pass_template_field.name, pass_template_id: @pass_template_field.pass_template_id, path: @pass_template_field.path } }
    assert_redirected_to pass_template_field_url(@pass_template_field)
  end

  test "should destroy pass_template_field" do
    assert_difference("PassTemplateField.count", -1) do
      delete pass_template_field_url(@pass_template_field)
    end

    assert_redirected_to pass_template_fields_url
  end
end
