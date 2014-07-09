# Resque tasks
require 'resque/tasks'
require 'resque/scheduler/tasks'

namespace :resque do
  task :setup => :environment do
    require 'resque'
    require 'resque/scheduler'

    Resque.schedule = YAML.load_file(Rails.root.join('config/resque_schedule.yml'))
  end
end
