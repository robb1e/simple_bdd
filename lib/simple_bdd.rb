require "simple_bdd/version"
require "simple_bdd/step_not_implemented"
require "simple_bdd/step_notification"

begin
  require "rspec/core"
rescue LoadError
end

module SimpleBdd

  RSpec.configuration.add_setting(:raise_error_on_missing_step_implementation,
                                  default: false) if defined?(::RSpec)

  %w[Given When Then And Also But].each do |method|
    define_method(method) do |message|
      method_name = methodize(message)
      if respond_to? method_name || !defined?(::RSpec)
        notification = StepNotification.new(method, message)
        RSpec.configuration.reporter.notify :before_step, notification
        send method_name
      else
        unless RSpec.configuration.raise_error_on_missing_step_implementation?
          pending(method_name)
        end
        raise StepNotImplemented, method_name
      end
    end

    alias_method method.downcase, method
  end

  PRESERVED_CHARS = '\\w'
  CONVERTED_CHARS = Regexp.escape(' /-')

  def methodize(message)
    message
      .downcase
      .gsub(/[^#{PRESERVED_CHARS}#{CONVERTED_CHARS}]/, "")
      .gsub(/[#{CONVERTED_CHARS}]+/, "_")
  end

  %w[behavior behaviour behaves_like by and_by it_also].each do |method|
    define_method(method) do |*, &block|
      block.call
    end
  end
end
