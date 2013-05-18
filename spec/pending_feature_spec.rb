require 'spec_helper'

describe "Pending features in rspec" do
  it "should make the step pending" do
    self.should_receive(:pending).with("i_have_not_defined_a_step")
    Given "I have not defined a step"
  end

  it "should still raise NoMethodError in code under test" do
    class << self
        def i_call_an_undefined_method
            undefined_method()
        end
    end

    expect {
        Then "I call an undefined method"
    }.to raise_error(NoMethodError)
  end
end
