require "simple_bdd/version"

module SimpleBdd
  %w[Given When Then And Also].each do |method|
    define_method(method) do |message|
      translated_message = translate_message(message)
      begin
        send translated_message
      rescue NoMethodError
        STDOUT.puts("def #{translated_message}\n\nend")
        fail
      end
    end

    def translate_message(message)
      message.downcase.gsub(" ", "_").gsub(/\W/, "")
    end

    alias_method method.downcase, method
  end
end
