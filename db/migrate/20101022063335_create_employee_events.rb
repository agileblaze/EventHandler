class CreateEmployeeEvents < ActiveRecord::Migration
  def self.up
    create_table :employee_events do |t|
      t.integer    :event_id
      t.integer    :employee_id
      t.date       :event_date
      t.integer    :year
      t.integer    :day
      t.integer    :month
      t.timestamps
    end
  end

  def self.down
    drop_table :employee_events
  end
end
