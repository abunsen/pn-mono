require "application_system_test_case"

class BillingLedgersTest < ApplicationSystemTestCase
  setup do
    @billing_ledger = billing_ledgers(:one)
  end

  test "visiting the index" do
    visit billing_ledgers_url
    assert_selector "h1", text: "Billing ledgers"
  end

  test "should create billing ledger" do
    visit billing_ledgers_url
    click_on "New billing ledger"

    fill_in "Account", with: @billing_ledger.account_id
    fill_in "Amount", with: @billing_ledger.amount
    fill_in "Event name", with: @billing_ledger.event_name
    fill_in "Issued pass", with: @billing_ledger.issued_pass_id
    fill_in "Memo", with: @billing_ledger.memo
    fill_in "Payment method", with: @billing_ledger.payment_method_id
    fill_in "Properties", with: @billing_ledger.properties
    click_on "Create Billing ledger"

    assert_text "Billing ledger was successfully created"
    click_on "Back"
  end

  test "should update Billing ledger" do
    visit billing_ledger_url(@billing_ledger)
    click_on "Edit this billing ledger", match: :first

    fill_in "Account", with: @billing_ledger.account_id
    fill_in "Amount", with: @billing_ledger.amount
    fill_in "Event name", with: @billing_ledger.event_name
    fill_in "Issued pass", with: @billing_ledger.issued_pass_id
    fill_in "Memo", with: @billing_ledger.memo
    fill_in "Payment method", with: @billing_ledger.payment_method_id
    fill_in "Properties", with: @billing_ledger.properties
    click_on "Update Billing ledger"

    assert_text "Billing ledger was successfully updated"
    click_on "Back"
  end

  test "should destroy Billing ledger" do
    visit billing_ledger_url(@billing_ledger)
    click_on "Destroy this billing ledger", match: :first

    assert_text "Billing ledger was successfully destroyed"
  end
end
