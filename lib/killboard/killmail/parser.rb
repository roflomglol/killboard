class Killmail::Parser
  attr_reader :body, :victim_parser

  def initialize(body)
    @body = body
    @victim_parser = Killmail::VictimParser.new
  end

  def parse
    {
      killed_at: parse_killed_at,
      victim: victim_parser.parse(victim)
    }
  end

  private

  def victim
    body[/\n\n(?<victim>Victim:.+\n(?:.+\n){7})\n/, :victim]
  end

  def parse_killed_at
    body[/^\d{4}.\d{2}.\d{2} \d{2}:\d{2}:\d{2}$/]
  end
end
