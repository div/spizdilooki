ENV["REDISTOGO_URL"] ||= "redis://div69:cb94426522558120b5d8f37711eaeec0@angler.redistogo.com:9674/"

uri = URI.parse(ENV["REDISTOGO_URL"])
Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)

Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection }