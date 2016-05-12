ENV["REDISCLOUD_URL"] = 'redis://rediscloud:aINWhpF72SwYxa0Y@pub-redis-13844.us-east-1-4.4.ec2.garantiadata.com:13844'
uri = URI.parse(ENV["REDISCLOUD_URL"] || "redis://localhost:6379/" )
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)