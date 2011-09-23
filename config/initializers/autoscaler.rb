require 'resque/plugins/resque_heroku_autoscaler'

if (Rails.env == 'development')    # disable autoscaler in development
  Resque::Plugins::HerokuAutoscaler.config do |c|
    c.scaling_disabled = true
  end
end