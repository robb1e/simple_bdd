require 'spec_helper'

class SimpleBddExample
  include SimpleBdd

  def i_call_an_undefined_method
    undefined_method_raises_error()
  end
end

describe "Pending features in rspec" do

  subject { SimpleBddExample.new }

  context "when raise_error_on_missing_step_implementation is true" do
    before(:each) do
      @raise_error = RSpec.configuration.raise_error_on_missing_step_implementation
      RSpec.configuration.raise_error_on_missing_step_implementation = true
    end

    it "raises an error on missing step implementations" do
      expect {
        subject.Given "I have not defined a step"
      }.to raise_error SimpleBdd::StepNotImplemented
    end

    after(:each) do
      RSpec.configuration.raise_error_on_missing_step_implementation = @raise_error
    end
  end

  context "when raise_error_on_missing_step_implementation is false" do
    before(:each) do
      @raise_error = RSpec.configuration.raise_error_on_missing_step_implementation
      RSpec.configuration.raise_error_on_missing_step_implementation = false
    end

    it "makes the step pending" do
      expect(subject).to receive(:pending).with("i_have_not_defined_a_step")
      expect { subject.Given "I have not defined a step" }.to raise_error SimpleBdd::StepNotImplemented
    end

    after(:each) do
      RSpec.configuration.raise_error_on_missing_step_implementation = @raise_error
    end
  end

  it "should still raise NoMethodError in code under test" do
    expect {
      subject.Then "I call an undefined method"
    }.to raise_error(NoMethodError, /raises_error/)
  end
end
