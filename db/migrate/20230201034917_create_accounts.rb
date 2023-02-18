class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :phone_number
      t.string :website

      t.timestamps
    end
  end
end
