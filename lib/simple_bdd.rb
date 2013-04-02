require "simple_bdd/version"

module SimpleBdd

  %w[Given When Then And].each do |method|
    define_method(method) do |message|
      _method = message.downcase.gsub(" ", "_").gsub(/\W/, "")
      send(_method)
    end

    alias_method method.downcase, method
  end

end
