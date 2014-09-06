require 'spec_helper'

class SimpleBddExample
  include SimpleBdd
end

describe SimpleBddExample do
  let(:subject) { SimpleBddExample.new }

  let(:reporter) do
    double(:reporter, notify: nil)
  end

  before(:each) do
    RSpec.configuration.stub(:reporter).and_return(reporter)
  end
  after(:each) do
    RSpec.configuration.unstub(:reporter)
  end

  describe "#given, #when, #then, #and, #also, #but" do
    ["given", "when", "then", "and", "Given", "When", "Then", "And", "Also", "also", "But", "but"].each do |method|
      it "calls the method after translating the string" do
        expect(subject).to receive(:something)
        subject.send(method, "something")
      end

      it "sends the appropriate before_step notification" do
        allow(subject).to receive(:something)

        expect(reporter).to receive(:notify) do |type, notification|
          @notification = notification if type == :before_step
        end

        subject.send(method, "something")
        expect(@notification.method).to eq(method.capitalize)
        expect(@notification.message).to eq("something")
      end
    end
  end

  describe "#methodize" do
    it "removes special chars" do
      expect(subject.send(:methodize, "bond, james bond")).to eq "bond_james_bond"
    end

    it "converts to lower case" do
      expect(subject.send(:methodize, "HELLO WORLD")).to eq "hello_world"
    end

    it "compacts adjacent separators" do
      expect(subject.send(:methodize, "Bates & Lolcat Realty")).to eq "bates_lolcat_realty"
      expect(subject.send(:methodize, "Ruby / Python / Scala, same deal")).to eq "ruby_python_scala_same_deal"
    end

    it "underscores slashes" do
      expect(subject.send(:methodize, "Chocolate/Vanilla Cake")).to eq "chocolate_vanilla_cake"
    end

    it "underscores hyphens" do
      expect(subject.send(:methodize, "Red-Velvet Cake")).to eq "red_velvet_cake"
    end
  end

  ["behavior", "behaviour", "by", "and_by", "it_also", "behaves_like"].each do |method|
    describe "##{method}" do
      it 'calls the block' do
        called = false
        subject.send(method, "an unused parameter") do
          called = true
        end

        expect(called).to eq true
      end
    end
  end

end
