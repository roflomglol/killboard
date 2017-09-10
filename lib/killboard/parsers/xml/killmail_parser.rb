module Parsers
  module XML
    class KillmailParser

      attr_reader :xml

      def initialize(xml)
        @xml = Nokogiri::XML(xml)
      end

      def call
        {
          victim: victim,
          attackers: attackers,
          items: items
        }
      end

      def victim
        victim_xml = xml.xpath('/row/victim')

        {
          pilot_id: victim_xml.attribute('characterID').value.to_i,
          pilot_name: victim_xml.attribute('characterName').value,
          corporation_id: victim_xml.attribute('corporationID').value.to_i,
          corportaion_name: victim_xml.attribute('corporationName').value,
          alliance_id: victim_xml.attribute('allianceID').value.to_i,
          alliance_name: victim_xml.attribute('allianceName').value,
          faction_id: victim_xml.attribute('factionID').value.to_i,
          ship_type_id: victim_xml.attribute('shipTypeID').value.to_i,
          damage_taken: victim_xml.attribute('damageTaken').value.to_i
        }
      end

      def attackers
        attackers_xml = xml.xpath('//*[@name="attackers"]/row')

        attackers_xml.map(&method(:parse_attacker))
      end

      def items
        items_xml = xml.xpath('//*[@name="items"]/row')

        items_xml.map(&method(:parse_item))
      end

      private

      def parse_attacker(attacker_xml)
        {
          pilot_id: attacker_xml.attribute('characterID').value.to_i,
          pilot_name: attacker_xml.attribute('characterName').value,
          corporation_id: attacker_xml.attribute('corporationID').value.to_i,
          corporation_name: attacker_xml.attribute('corporationName').value,
          alliance_id: attacker_xml.attribute('allianceID').value.to_i,
          alliance_name:attacker_xml.attribute('allianceName').value,
          faction_id: attacker_xml.attribute('factionID').value.to_i,
          faction_name: attacker_xml.attribute('factionName').value,
          security_status: attacker_xml.attribute('securityStatus').value.to_f,
          damage_done: attacker_xml.attribute('damageDone').value.to_i,
          final_blow: attacker_xml.attribute('finalBlow').value.to_i,
          weapon_type_id: attacker_xml.attribute('weaponTypeID').value.to_i,
          ship_type_id: attacker_xml.attribute('shipTypeID').value.to_i
        }
      end

      def parse_item(item_xml)
        {
          type_id: item_xml.attribute('typeID').value.to_i,
          flag: item_xml.attribute('flag').value.to_i,
          qty_dropped: item_xml.attribute('qtyDropped').value.to_i,
          qty_destroyed: item_xml.attribute('qtyDestroyed').value.to_i,
          singleton: item_xml.attribute('singleton').value.to_i
        }
      end
    end
  end
end
