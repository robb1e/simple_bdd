require "simple_bdd/version"

module SimpleBdd
  %w[Given When Then And Also].each do |method|
    define_method(method) do |message|
      begin
        send methodize(message)
      rescue NoMethodError => error
        message_does_not_exist(
          methodize(message), error
        )
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

  if defined?(::RSpec)
    def message_does_not_exist(message, error)
      pending(message)
    end
  else
    def message_does_not_exist(message, error)
      raise error
    end
  end
end
