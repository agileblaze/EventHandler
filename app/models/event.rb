class Event < ActiveRecord::Base
  gem 'whenever', :require => false
  has_many :employee_events

  def self.s1
     @event=Event.new
     @event.save
   end

end
