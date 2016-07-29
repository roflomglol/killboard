class Killmail::InvolvedPartyParser
  KEYS = %i(
    name
    security
    corp
    alliance
    faction
    ship
    weapon
    damage_done
  )

  def parse(source)
    @source = source

    KEYS.each_with_object({}) do |key, hash|
      hash[key] = parse_key(key)
    end.merge(laid_the_final_blow: laid_the_final_blow?)
  end

  private

  attr_reader :source

  def parse_key(key)
    source[/#{key.to_s.titleize}: (?<#{key}>[\w \.\-']+)/, key]&.strip
  end

  def laid_the_final_blow?
    source.include?('(laid the final blow)')
  end
end
