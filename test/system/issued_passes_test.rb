require "application_system_test_case"

class IssuedPassesTest < ApplicationSystemTestCase
  setup do
    @issued_pass = issued_passes(:one)
  end

  test "visiting the index" do
    visit issued_passes_url
    assert_selector "h1", text: "Issued passes"
  end

  test "should create issued pass" do
    visit issued_passes_url
    click_on "New issued pass"

    fill_in "Delivered date", with: @issued_pass.delivered_date
    fill_in "Delivered via", with: @issued_pass.delivered_via
    fill_in "Install date", with: @issued_pass.install_date
    fill_in "Install ip", with: @issued_pass.install_ip
    fill_in "Install user agent", with: @issued_pass.install_user_agent
    fill_in "Issue date", with: @issued_pass.issue_date
    fill_in "Pass template", with: @issued_pass.pass_template_id
    click_on "Create Issued pass"

    assert_text "Issued pass was successfully created"
    click_on "Back"
  end

  test "should update Issued pass" do
    visit issued_pass_url(@issued_pass)
    click_on "Edit this issued pass", match: :first

    fill_in "Delivered date", with: @issued_pass.delivered_date
    fill_in "Delivered via", with: @issued_pass.delivered_via
    fill_in "Install date", with: @issued_pass.install_date
    fill_in "Install ip", with: @issued_pass.install_ip
    fill_in "Install user agent", with: @issued_pass.install_user_agent
    fill_in "Issue date", with: @issued_pass.issue_date
    fill_in "Pass template", with: @issued_pass.pass_template_id
    click_on "Update Issued pass"

    assert_text "Issued pass was successfully updated"
    click_on "Back"
  end

  test "should destroy Issued pass" do
    visit issued_pass_url(@issued_pass)
    click_on "Destroy this issued pass", match: :first

    assert_text "Issued pass was successfully destroyed"
  end
end
