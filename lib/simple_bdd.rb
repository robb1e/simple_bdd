require "simple_bdd/version"

module SimpleBdd
  %w[Given When Then And Also].each do |method|
    define_method(method) do |message|
      begin
        send translate_message(message)
      rescue NoMethodError
        STDOUT.puts("def #{translate_message(message)}\n\nend")
        fail
      end
    end

    def translate_message(message)
      message.downcase.gsub(" ", "_").gsub(/\W/, "")
    end

    alias_method method.downcase, method
  end
end
