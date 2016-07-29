module Parsers
  class InvolvedPartyParser < BaseParser
    self.keys += %i(
      name
      ship
      weapon
      damage_done
    )

    def parse(source)
      super(source).merge(laid_the_final_blow: laid_the_final_blow?)
    end

    private

    def laid_the_final_blow?
      source.include?('(laid the final blow)')
    end
  end
end
