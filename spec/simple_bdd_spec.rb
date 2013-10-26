require 'spec_helper'

class SimpleBddExample
  include SimpleBdd
end

describe SimpleBddExample do
  let(:subject) { SimpleBddExample.new }

  describe "#given, #when, #then, #and, #also, #but" do
    ["given", "when", "then", "and", "Given", "When", "Then", "And", "Also", "also", "But", "but"].each do |method|
      it "calls the method after translating the string" do
        subject.should_receive(:something)
        subject.send(method, "something")
      end
    end
  end

  describe "#methodize" do
    it "removes special chars" do
      subject.send(:methodize, "bond, james bond").should == "bond_james_bond"
    end

    it "converts to lower case" do
      subject.send(:methodize, "HELLO WORLD").should == "hello_world"
    end

    it "compacts adjacent separators" do
      subject.send(:methodize, "Bates & Lolcat Realty").should == "bates_lolcat_realty"
      subject.send(:methodize, "Ruby / Python / Scala, same deal").should == "ruby_python_scala_same_deal"
    end

    it "underscores slashes" do
      subject.send(:methodize, "Chocolate/Vanilla Cake").should == "chocolate_vanilla_cake"
    end
  end

  ["behavior", "behaviour", "by", "and_by", "it_also", "behaves_like"].each do |method|
    describe "##{method}" do
      it 'calls the block' do
        called = false
        subject.send(method, "an unused parameter") do
          called = true
        end

        expect(called).to be_true
      end
    end
  end

end
