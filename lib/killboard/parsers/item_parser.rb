module Parsers
  class ItemParser
    def parse(source)
      @source = source

      {
        item: parse_item_name,
        qty: parse_qty,
        position: determine_position
      }
    end

    private

    attr_reader :source

    def parse_item_name
      source[/^(?<item>[\w -]+)/, :item]
    end

    def parse_qty
      source[/Qty: (?<qty>\d+)/, :qty]
    end

    def determine_position
      case source
      when /(Cargo)/
        :cargo
      when /(Drone Bay)/
        :drone_bay
      else
        :fitted
      end
    end
  end
end
