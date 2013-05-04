require "simple_bdd/version"

module SimpleBdd

  %w[Given When Then And].each do |method|
    define_method(method) do |message|
      send methodize(message)
    end

    alias_method method.downcase, method
  end

  private

  def methodize str
    str.downcase.gsub(" ", "_").gsub(/\W/, "")
  end

end
