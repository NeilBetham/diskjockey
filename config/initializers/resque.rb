require 'resque'
require 'resque/scheduler'
require 'resque/scheduler/server'
Resque.redis.namespace = "resque:diskjockey"
