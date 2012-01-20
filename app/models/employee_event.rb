class EmployeeEvent < ActiveRecord::Base
   belongs_to :event
   belongs_to :employee
   #validates_presence_of :employee_id
   validates_presence_of :event_date
   #validates_uniqueness_of :employee_ids
end
