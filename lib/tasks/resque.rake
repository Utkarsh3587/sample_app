require 'resque/tasks'
namespace :resque do
  task :setup => :environment do
    require 'resque'
    ENV['QUEUE'] = '*'
    ENV['PIDFILE'] = './resque.pid'
    ENV['BACKGROUND'] = 'yes'
    ENV['VERBOSE'] = '1'

    Resque.redis = 'redis://rediscloud:aINWhpF72SwYxa0Y@pub-redis-13844.us-east-1-4.4.ec2.garantiadata.com:13844
'#'127.0.0.1:6379'
  end
end

Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection } #this is necessary for production environments, otherwise your background jobs will start to fail when hit from many different connections.

desc 'Alias for resque:work (To run workers on Heroku)'
task 'jobs:work' => 'resque:work'