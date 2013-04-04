require 'rspec'

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'

  require File.dirname(__FILE__) + '/../lib/simple_bdd'
  config.include SimpleBdd
end

describe "something" do
  it "provides simple bdd output for missing step definitions" do
    Given "I am using simple bdd"
    When "when I call a message that is not defined"
    Then "I should see it output"
  end

  def i_am_using_simple_bdd
    # do nothing
  end

  def when_i_call_a_message_that_is_not_defined
    # do nothing
  end
end
