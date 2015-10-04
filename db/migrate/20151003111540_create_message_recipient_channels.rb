class CreateMessageRecipientChannels < ActiveRecord::Migration
  def change
    create_table :message_recipient_channels do |t|
      t.references :message, index: true, foreign_key: true
      t.references :channel, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
