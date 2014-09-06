RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'

  require File.dirname(__FILE__) + '/../lib/simple_bdd/rspec'
end
