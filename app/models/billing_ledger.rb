class BillingLedger < ApplicationRecord
  belongs_to :account
  belongs_to :payment_method
  belongs_to :issued_pass
end
