module Parsers
  class InvolvedPartiesParser
    def initialize
      @involved_party_parser = InvolvedPartyParser.new
    end

    def parse(source)
      source.split(/\n\n/).map do |party|
        involved_party_parser.parse(party)
      end
    end

    private

    attr_reader :involved_party_parser
  end
end
