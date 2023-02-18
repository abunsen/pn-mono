class CreatePaymentMethods < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_methods do |t|
      t.string :kind
      t.string :last_4
      t.string :ex_id
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
