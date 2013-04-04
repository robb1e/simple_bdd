require "simple_bdd/version"

module SimpleBdd
  @@missing_examples = []

  %w[Given When Then And Also].each do |method|
    define_method(method) do |message|
      translated_message = translate_message(message)
      begin
        send translated_message
      rescue NoMethodError
        @@missing_examples << "def #{translated_message}\nend"
        fail
      end
    end

    def translate_message(message)
      message.downcase.gsub(" ", "_").gsub(/\W/, "")
    end

    alias_method method.downcase, method
  end

  at_exit do
    if @@missing_examples.size > 0
      puts "\n\n" + "*" * 100
      puts "\nMissing SimpleBdd Examples...\n\n"
      @@missing_examples.each do |example|
        STDOUT.puts(example)
      end
      puts "\n" + "*" * 100 + "\n\n"
    end
  end

  def self.missing_examples
    @@missing_examples
  end

  def self.missing_examples=(examples)
    @@missing_examples = examples
  end
end
