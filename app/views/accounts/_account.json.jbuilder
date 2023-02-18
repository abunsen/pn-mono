json.extract! account, :id, :name, :phone_number, :website, :created_at, :updated_at
json.url account_url(account, format: :json)
