class CreateBillingLedgers < ActiveRecord::Migration[7.0]
  def change
    create_table :billing_ledgers do |t|
      t.references :account, null: false, foreign_key: true
      t.string :event_name
      t.json :properties
      t.decimal :amount
      t.references :payment_method, null: false, foreign_key: true
      t.references :issued_pass, null: false, foreign_key: true
      t.string :memo

      t.timestamps
    end
  end
end
