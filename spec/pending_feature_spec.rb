require 'spec_helper'

describe "Pending features in rspec" do
  it "should make the step pending" do
    self.should_receive(:pending).with("i_have_not_defined_a_step")
    Given "I have not defined a step"
  end
end
