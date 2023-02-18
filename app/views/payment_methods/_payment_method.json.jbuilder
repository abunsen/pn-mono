json.extract! payment_method, :id, :kind, :last_4, :ex_id, :account_id, :created_at, :updated_at
json.url payment_method_url(payment_method, format: :json)
