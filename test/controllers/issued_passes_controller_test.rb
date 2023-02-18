require "test_helper"

class IssuedPassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @issued_pass = issued_passes(:one)
  end

  test "should get index" do
    get issued_passes_url
    assert_response :success
  end

  test "should get new" do
    get new_issued_pass_url
    assert_response :success
  end

  test "should create issued_pass" do
    assert_difference("IssuedPass.count") do
      post issued_passes_url, params: { issued_pass: { delivered_date: @issued_pass.delivered_date, delivered_via: @issued_pass.delivered_via, install_date: @issued_pass.install_date, install_ip: @issued_pass.install_ip, install_user_agent: @issued_pass.install_user_agent, issue_date: @issued_pass.issue_date, pass_template_id: @issued_pass.pass_template_id } }
    end

    assert_redirected_to issued_pass_url(IssuedPass.last)
  end

  test "should show issued_pass" do
    get issued_pass_url(@issued_pass)
    assert_response :success
  end

  test "should get edit" do
    get edit_issued_pass_url(@issued_pass)
    assert_response :success
  end

  test "should update issued_pass" do
    patch issued_pass_url(@issued_pass), params: { issued_pass: { delivered_date: @issued_pass.delivered_date, delivered_via: @issued_pass.delivered_via, install_date: @issued_pass.install_date, install_ip: @issued_pass.install_ip, install_user_agent: @issued_pass.install_user_agent, issue_date: @issued_pass.issue_date, pass_template_id: @issued_pass.pass_template_id } }
    assert_redirected_to issued_pass_url(@issued_pass)
  end

  test "should destroy issued_pass" do
    assert_difference("IssuedPass.count", -1) do
      delete issued_pass_url(@issued_pass)
    end

    assert_redirected_to issued_passes_url
  end
end
