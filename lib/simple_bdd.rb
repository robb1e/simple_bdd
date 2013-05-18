require "simple_bdd/version"

module SimpleBdd
  %w[Given When Then And Also].each do |method|
    define_method(method) do |message|
        method_name = methodize(message)
        if respond_to? method_name || !defined?(::RSpec)
            send method_name
        else
            pending(method_name)
        end
    end

    alias_method method.downcase, method
  end

  PRESERVED_CHARS = '\\w'
  CONVERTED_CHARS = Regexp.escape(' /')

  def methodize(message)
    message
      .downcase
      .gsub(/[^#{PRESERVED_CHARS}#{CONVERTED_CHARS}]/, "")
      .gsub(/[#{CONVERTED_CHARS}]+/, "_")
  end
end
