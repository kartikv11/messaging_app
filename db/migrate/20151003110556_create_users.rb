class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email_id
      t.boolean :is_active, default: false
      t.string :team_name
      t.string :full_name
      t.string :password

      t.timestamps null: false
    end
  end
end
