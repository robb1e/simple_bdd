require 'spec_helper'

class Jerk
  include Jerkin
end

describe Jerk do

  let(:subject) { Jerk.new }

  describe "#given, #when, #then, #and" do
    ["given", "when", "then", "and"].each do |method|
      it "calls the method after translating the string" do
        subject.should_receive(:something_something_darkside)
        subject.send(method, "Something, Something Darkside")
      end
    end
  end
end
