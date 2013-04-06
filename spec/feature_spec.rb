require 'spec_helper'

describe "Dogfooding SimpleBdd" do
  RSpec.configure do |config|
    config.include SimpleBdd
  end

  describe "Simple BDD in Rspec" do
    feature "using feature/scenario to describe behavior" do
      scenario "when defining a feature" do
        Given "I use feature to describe the simple behavior driven development story"
        And "I use scenario to describe the simple behavior driven development story"
        Then "my tests should run and pass"
      end
    end

    def i_use_feature_to_describe_the_simple_behavior_driven_development_story
      1.should == 1
    end

    def i_use_scenario_to_describe_the_simple_behavior_driven_development_story
      1.should == 1
    end

    def my_tests_should_run_and_pass
      1.should == 1
    end
  end
end
