require "application_system_test_case"

class IssuedPassValuesTest < ApplicationSystemTestCase
  setup do
    @issued_pass_value = issued_pass_values(:one)
  end

  test "visiting the index" do
    visit issued_pass_values_url
    assert_selector "h1", text: "Issued pass values"
  end

  test "should create issued pass value" do
    visit issued_pass_values_url
    click_on "New issued pass value"

    fill_in "Issued pass", with: @issued_pass_value.issued_pass_id
    fill_in "Path", with: @issued_pass_value.path
    fill_in "Value", with: @issued_pass_value.value
    click_on "Create Issued pass value"

    assert_text "Issued pass value was successfully created"
    click_on "Back"
  end

  test "should update Issued pass value" do
    visit issued_pass_value_url(@issued_pass_value)
    click_on "Edit this issued pass value", match: :first

    fill_in "Issued pass", with: @issued_pass_value.issued_pass_id
    fill_in "Path", with: @issued_pass_value.path
    fill_in "Value", with: @issued_pass_value.value
    click_on "Update Issued pass value"

    assert_text "Issued pass value was successfully updated"
    click_on "Back"
  end

  test "should destroy Issued pass value" do
    visit issued_pass_value_url(@issued_pass_value)
    click_on "Destroy this issued pass value", match: :first

    assert_text "Issued pass value was successfully destroyed"
  end
end
