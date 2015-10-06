class AddPrivateFieldToChannel < ActiveRecord::Migration
  def change
    add_column :channels, :is_private, :boolean
  end
end
