require "simple_bdd/version"

module SimpleBdd
  %w[Given When Then And Also].each do |method|
    define_method(method) do |message|
        method_name = methodize(message)
        if respond_to? method_name
            send method_name
        elsif defined?(::RSpec)
            pending(method_name)
        else
            send method_name # cause NoMethodError
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
