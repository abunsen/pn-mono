require "test_helper"

class BillingLedgersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @billing_ledger = billing_ledgers(:one)
  end

  test "should get index" do
    get billing_ledgers_url
    assert_response :success
  end

  test "should get new" do
    get new_billing_ledger_url
    assert_response :success
  end

  test "should create billing_ledger" do
    assert_difference("BillingLedger.count") do
      post billing_ledgers_url, params: { billing_ledger: { account_id: @billing_ledger.account_id, amount: @billing_ledger.amount, event_name: @billing_ledger.event_name, issued_pass_id: @billing_ledger.issued_pass_id, memo: @billing_ledger.memo, payment_method_id: @billing_ledger.payment_method_id, properties: @billing_ledger.properties } }
    end

    assert_redirected_to billing_ledger_url(BillingLedger.last)
  end

  test "should show billing_ledger" do
    get billing_ledger_url(@billing_ledger)
    assert_response :success
  end

  test "should get edit" do
    get edit_billing_ledger_url(@billing_ledger)
    assert_response :success
  end

  test "should update billing_ledger" do
    patch billing_ledger_url(@billing_ledger), params: { billing_ledger: { account_id: @billing_ledger.account_id, amount: @billing_ledger.amount, event_name: @billing_ledger.event_name, issued_pass_id: @billing_ledger.issued_pass_id, memo: @billing_ledger.memo, payment_method_id: @billing_ledger.payment_method_id, properties: @billing_ledger.properties } }
    assert_redirected_to billing_ledger_url(@billing_ledger)
  end

  test "should destroy billing_ledger" do
    assert_difference("BillingLedger.count", -1) do
      delete billing_ledger_url(@billing_ledger)
    end

    assert_redirected_to billing_ledgers_url
  end
end
