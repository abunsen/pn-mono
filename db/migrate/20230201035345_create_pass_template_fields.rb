class CreatePassTemplateFields < ActiveRecord::Migration[7.0]
  def change
    create_table :pass_template_fields do |t|
      t.string :name
      t.string :description
      t.string :path
      t.string :default_value
      t.references :pass_template, null: false, foreign_key: true

      t.timestamps
    end
  end
end
