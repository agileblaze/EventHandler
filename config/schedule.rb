#job_type :runner,  'cd :path && bundle exec script/runner -e :environment ":task"'


# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end
# Learn more: http://github.com/javan/whenever
every  1.days,:at=>'9:50am'  do
  #command  "/usr/local/bin/ruby /home/users/shamith/railsproject/eventhandler/eventhandler/script/runner Emailer.s1"
  #command "mkdir /home/users/shamith/sha",:environment => 'staging'
  #runner "Emailer.s1"
  #command  "/usr/local/bin/ruby /home/users/shamith/railsproject/eventhandler/eventhandler/script/runner ManageController.sendmail"
  #command  "/usr/local/bin/ruby /home/users/shamith/railsproject/eventhandler/eventhandler/script/runner -e production Emailer.dailymail"
  runner "Emailer.dailymail",:environment => 'development'
end

every :monday, :at => '9:42am' do # Use any day of the week or :weekend, :weekday
 # command  "/usr/local/bin/ruby /home/users/shamith/railsproject/eventhandler/eventhandler/script/runner Emailer.weeklymail",:environment => 'staging'
  runner "Emailer.weeklymail",:environment => 'development'
end
