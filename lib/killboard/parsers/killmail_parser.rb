module Parsers
  class KillmailParser
    def initialize(source)
      @source                  = source
      @victim_parser           = VictimParser.new
      @involved_parties_parser = InvolvedPartiesParser.new
    end

    def parse
      {
        killed_at: parse_killed_at,
        victim: victim_parser.parse(victim),
        involved_parties: involved_parties_parser.parse(involved_parties)
      }
    end

    private

    attr_reader :source, :victim_parser, :involved_parties_parser

    def victim
      source[/\n\n(?<victim>Victim:.+\n(?:.+\n){7})\n/, :victim]
    end

    def parse_killed_at
      source[/^\d{4}.\d{2}.\d{2} \d{2}:\d{2}:\d{2}$/]
    end

    def involved_parties
      source[/Involved parties:\n\n(?<involved_parties>(?:(?:.+\n){8}\n|(?:.+\n){2}\n)*)/,
           :involved_parties]
    end
  end
end
