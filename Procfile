web:     bundle exec thin start -p $PORT
worker:  bundle exec rake resque:work
clock: bundle exec clockwork app/clock/clock.rb