require 'resque/plugins/resque_heroku_autoscaler'

Resque::Plugins::HerokuAutoscaler.config do |c|
  c.heroku_user = "iskiche@gmail.com"
  c.heroku_pass = "348797"
  c.heroku_app  = "spizdilooki_#{Rails.env}"
end