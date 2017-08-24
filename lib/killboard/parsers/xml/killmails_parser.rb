module Parsers
  module XML
    class KillmailsParser

      attr_reader :xml

      def initialize(xml)
        @xml = Nokogiri::XML(xml)
      end

      def call
        xml.xpath('eveapi/result/rowset/row').map do |killmail_row|
          KillmailParser.new(killmail_row.to_s).call
        end
      end
    end
  end
end
