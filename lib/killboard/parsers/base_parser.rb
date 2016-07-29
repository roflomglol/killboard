module Parsers
  class BaseParser
    class_attribute :keys

    self.keys = %i(
      corp
      alliance
      faction
      security
    )

    def parse(source)
      @source = source

      keys.each_with_object({}) do |key, hash|
        hash[key] = parse_key(key)
      end
    end

    private

    attr_reader :source

    def parse_key(key)
      source[/#{key.to_s.titleize}: (?<#{key}>[\w \.\-']+)/, key]&.strip
    end
  end
end
