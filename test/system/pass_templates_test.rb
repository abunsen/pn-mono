require "application_system_test_case"

class PassTemplatesTest < ApplicationSystemTestCase
  setup do
    @pass_template = pass_templates(:one)
  end

  test "visiting the index" do
    visit pass_templates_url
    assert_selector "h1", text: "Pass templates"
  end

  test "should create pass template" do
    visit pass_templates_url
    click_on "New pass template"

    fill_in "Account", with: @pass_template.account_id
    fill_in "Kind", with: @pass_template.kind
    fill_in "Platform", with: @pass_template.platform
    click_on "Create Pass template"

    assert_text "Pass template was successfully created"
    click_on "Back"
  end

  test "should update Pass template" do
    visit pass_template_url(@pass_template)
    click_on "Edit this pass template", match: :first

    fill_in "Account", with: @pass_template.account_id
    fill_in "Kind", with: @pass_template.kind
    fill_in "Platform", with: @pass_template.platform
    click_on "Update Pass template"

    assert_text "Pass template was successfully updated"
    click_on "Back"
  end

  test "should destroy Pass template" do
    visit pass_template_url(@pass_template)
    click_on "Destroy this pass template", match: :first

    assert_text "Pass template was successfully destroyed"
  end
end
