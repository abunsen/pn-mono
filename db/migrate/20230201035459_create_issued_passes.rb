class CreateIssuedPasses < ActiveRecord::Migration[7.0]
  def change
    create_table :issued_passes do |t|
      t.references :pass_template, null: false, foreign_key: true
      t.datetime :issue_date
      t.datetime :install_date
      t.string :install_ip
      t.string :install_user_agent
      t.string :delivered_via
      t.datetime :delivered_date

      t.timestamps
    end
  end
end
