require File.join(File.dirname(__FILE__), '..', 'config', 'boot')
require File.join(File.dirname(__FILE__), '..', 'config', 'environment')

include Clockwork
require 'fetch_lookids'
handler do |job|
   
   Resque.enqueue(FetchLookIds)
end

every(1.hours, 'FetchLookIds')