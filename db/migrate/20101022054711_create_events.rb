class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :event
      t.text   :description
      t.boolean :user_specific
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
