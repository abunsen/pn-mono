json.extract! invoice, :id, :account_id, :start_date, :end_date, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
