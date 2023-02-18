json.extract! billing_ledger, :id, :account_id, :event_name, :properties, :amount, :payment_method_id, :issued_pass_id, :memo, :created_at, :updated_at
json.url billing_ledger_url(billing_ledger, format: :json)
