require "simple_bdd/version"

module SimpleBdd

  ["given", "when", "then", "and", "Given", "When", "Then", "And", "also", "Also"].each do |method|
    define_method(method) do |message|
      method = message.downcase.gsub(" ", "_").gsub(/\W/, "")
      send(method)
    end
  end

end
