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

require File.expand_path('../application', __FILE__)

env :SPOTNSNAP_SECRET_KEY_DEVISE, ENV['SPOTNSNAP_SECRET_KEY_DEVISE']
env :SPOTNSNAP_DATABASE_PASSWORD, ENV['SPOTNSNAP_DATABASE_PASSWORD']

set :output, File.join(Rails.root, "log/expiring_challenges.log")

every 10.minute, :roles => [:db] do
  runner "Challenge.expiring_challenge"
end