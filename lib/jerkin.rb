require "jerkin/version"

module Jerkin

  ["given", "when", "then", "and", "Given", "When", "Then", "And"].each do |method|
    define_method(method) do |message| 
      method = message.downcase.gsub(" ", "_").gsub(/\W/, "")
      send(method)
    end
  end

end
