class CreateIssuedPassValues < ActiveRecord::Migration[7.0]
  def change
    create_table :issued_pass_values do |t|
      t.references :issued_pass, null: false, foreign_key: true
      t.string :path
      t.string :value

      t.timestamps
    end
  end
end
