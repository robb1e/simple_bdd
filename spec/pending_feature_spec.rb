require 'spec_helper'

class SimpleBddExample
  include SimpleBdd

  def i_call_an_undefined_method
    undefined_method_raises_error()
  end
end

describe "Pending features in rspec" do

  subject { SimpleBddExample.new }

  it "should make the step pending" do
    subject.should_receive(:pending).with("i_have_not_defined_a_step")
    subject.Given "I have not defined a step"
  end

  it "should still raise NoMethodError in code under test" do
    expect {
      subject.Then "I call an undefined method"
    }.to raise_error(NoMethodError, /raises_error/)
  end
end
