require "simple_bdd/version"

module SimpleBdd
  %w[Given When Then And].each do |method|
    define_method(method) do |message|
      send message.downcase.gsub(" ", "_").gsub(/\W/, "")
    end

    alias_method method.downcase, method
  end

end
