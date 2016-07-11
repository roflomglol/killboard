class Killmail::VictimParser
  KEYS = %i(
    victim
    corp
    alliance
    faction
    destroyed
    system
    security
    damage_taken
  )

  attr_reader :body

  def parse(body)
    @body = body

    KEYS.each_with_object({}) do |key, hash|
      hash[key] = parse_key(key)
    end
  end

  private

  def parse_key(key)
    body[/#{key.to_s.titleize}: (?<#{key}>.+)/, key]
  end
end
