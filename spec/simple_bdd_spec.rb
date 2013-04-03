require 'spec_helper'

class SimpleBddExample
  include SimpleBdd
end

describe SimpleBddExample do
  let(:subject) { SimpleBddExample.new }

  describe "#given, #when, #then, #and, #also" do
    ["given", "when", "then", "and", "Given", "When", "Then", "And", "Also", "also"].each do |method|
      it "calls the method after translating the string" do
        subject.should_receive(:something_something_darkside)
        subject.send(method, "Something, Something Darkside")
      end
    end
  end
end
