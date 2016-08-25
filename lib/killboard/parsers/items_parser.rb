module Parsers
  class ItemsParser
    def initialize
      @item_parser = ItemParser.new
    end

    def parse(source)
      source.split(/\n/).map do |item|
        item_parser.parse(item)
      end
    end

    private

    attr_reader :item_parser
  end
end
