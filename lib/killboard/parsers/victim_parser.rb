module Parsers
  class VictimParser < BaseParser
    self.keys += %i(
      victim
      destroyed
      system
      damage_taken
    )
  end
end
