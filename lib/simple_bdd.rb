require "simple_bdd/version"

module SimpleBdd

  %w[Given When Then And].each do |method|
    define_method(method) do |message|
      send methodize(message)
    end

    alias_method method.downcase, method
  end

  private

  PRESERVED_CHARS = '\\w'
  CONVERTED_CHARS = Regexp.escape(' /')

  def methodize str
    str
      .downcase
      .gsub(/[^#{PRESERVED_CHARS}#{CONVERTED_CHARS}]/, "")
      .gsub(/[#{CONVERTED_CHARS}]+/, "_")
  end

end
