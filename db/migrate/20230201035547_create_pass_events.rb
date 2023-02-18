class CreatePassEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :pass_events do |t|
      t.references :issued_pass, null: false, foreign_key: true
      t.string :event_name

      t.timestamps
    end
  end
end
