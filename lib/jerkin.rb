require "jerkin/version"

module Jerkin

  ["given", "when", "then", "and"].each do |method|
    define_method(method) do |message| 
      method = message.downcase.gsub(" ", "_").gsub(/\W/, "")
      send(method)
    end
  end

end
