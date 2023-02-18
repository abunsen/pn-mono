class CreatePassTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :pass_templates do |t|
      t.references :account, null: false, foreign_key: true
      t.string :platform
      t.string :kind

      t.timestamps
    end
  end
end
