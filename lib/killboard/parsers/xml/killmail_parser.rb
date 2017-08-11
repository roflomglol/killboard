module Parsers
  module XML
    class KillmailParser

      attr_reader :xml

      def initialize(xml)
        @xml = Nokogiri::XML(xml)
      end

      def victim
        victim_xml = xml.xpath('/row/victim')

        {
          character_id: victim_xml.attribute('characterID').value.to_i,
          character_name: victim_xml.attribute('characterName').value,
          corporation_id: victim_xml.attribute('corporationID').value.to_i,
          corportaion_name: victim_xml.attribute('corporationName').value,
          alliance_id: victim_xml.attribute('allianceID').value.to_i,
          alliance_name: victim_xml.attribute('allianceName').value,
          faction_id: victim_xml.attribute('factionID').value.to_i,
          ship_type_id: victim_xml.attribute('shipTypeID').value.to_i,
          damage_taken: victim_xml.attribute('damageTaken').value.to_i
        }
      end
    end
  end
end
