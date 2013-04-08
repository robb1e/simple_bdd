require_relative '../simple_bdd'

module SimpleBdd
  def self.included(base)
    base.instance_eval do
      def feature(message, &block)
        describe message, &block
      end

      def scenario(message, &block)
        it message, &block
      end
    end
  end

  RSpec.configure do |config|
    config.include SimpleBdd
  end
end
