require "application_system_test_case"

class PassTemplateFieldsTest < ApplicationSystemTestCase
  setup do
    @pass_template_field = pass_template_fields(:one)
  end

  test "visiting the index" do
    visit pass_template_fields_url
    assert_selector "h1", text: "Pass template fields"
  end

  test "should create pass template field" do
    visit pass_template_fields_url
    click_on "New pass template field"

    fill_in "Default value", with: @pass_template_field.default_value
    fill_in "Description", with: @pass_template_field.description
    fill_in "Name", with: @pass_template_field.name
    fill_in "Pass template", with: @pass_template_field.pass_template_id
    fill_in "Path", with: @pass_template_field.path
    click_on "Create Pass template field"

    assert_text "Pass template field was successfully created"
    click_on "Back"
  end

  test "should update Pass template field" do
    visit pass_template_field_url(@pass_template_field)
    click_on "Edit this pass template field", match: :first

    fill_in "Default value", with: @pass_template_field.default_value
    fill_in "Description", with: @pass_template_field.description
    fill_in "Name", with: @pass_template_field.name
    fill_in "Pass template", with: @pass_template_field.pass_template_id
    fill_in "Path", with: @pass_template_field.path
    click_on "Update Pass template field"

    assert_text "Pass template field was successfully updated"
    click_on "Back"
  end

  test "should destroy Pass template field" do
    visit pass_template_field_url(@pass_template_field)
    click_on "Destroy this pass template field", match: :first

    assert_text "Pass template field was successfully destroyed"
  end
end
