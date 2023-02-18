require "test_helper"

class PassTemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pass_template = pass_templates(:one)
  end

  test "should get index" do
    get pass_templates_url
    assert_response :success
  end

  test "should get new" do
    get new_pass_template_url
    assert_response :success
  end

  test "should create pass_template" do
    assert_difference("PassTemplate.count") do
      post pass_templates_url, params: { pass_template: { account_id: @pass_template.account_id, kind: @pass_template.kind, platform: @pass_template.platform } }
    end

    assert_redirected_to pass_template_url(PassTemplate.last)
  end

  test "should show pass_template" do
    get pass_template_url(@pass_template)
    assert_response :success
  end

  test "should get edit" do
    get edit_pass_template_url(@pass_template)
    assert_response :success
  end

  test "should update pass_template" do
    patch pass_template_url(@pass_template), params: { pass_template: { account_id: @pass_template.account_id, kind: @pass_template.kind, platform: @pass_template.platform } }
    assert_redirected_to pass_template_url(@pass_template)
  end

  test "should destroy pass_template" do
    assert_difference("PassTemplate.count", -1) do
      delete pass_template_url(@pass_template)
    end

    assert_redirected_to pass_templates_url
  end
end
