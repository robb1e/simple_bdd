require "simple_bdd/version"

module SimpleBdd
  %w[Given When Then And].each do |method|
    define_method(method) do |message|
      send message.downcase.gsub(" ", "_").gsub(/\W/, "")
    end

    alias_method method.downcase, method
  end

  if defined?(::RSpec)
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
  end
end
