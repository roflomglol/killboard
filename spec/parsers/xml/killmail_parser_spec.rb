require 'rails_helper'

RSpec.describe Parsers::XML::KillmailParser do
  let(:xml_row) do
    <<~EOS
      <row killID="63937722" solarSystemID="30003276" killTime="2017-08-07 23:21:50" moonID="0">
        <victim characterID="614389879" characterName="TROUB1" corporationID="244898283" corporationName="OEG" allianceID="99006227" allianceName="Freedom Among the Stars" factionID="0" factionName="" damageTaken="461" shipTypeID="670" x="-1569902222880" y="242823050476.683" z="1747233802147.06" />
        <rowset name="attackers" columns="characterID,characterName,corporationID,corporationName,allianceID,allianceName,factionID,factionName,securityStatus,damageDone,finalBlow,weaponTypeID,shipTypeID">
          <row characterID="93235769" characterName="Ark Zxr" corporationID="497926671" corporationName="Unleashed' Fury" allianceID="1900696668" allianceName="The Initiative." factionID="0" factionName="" securityStatus="4.3038654000613" damageDone="136" finalBlow="1" weaponTypeID="2873" shipTypeID="22456" />
          <row characterID="119271912" characterName="Fistsandwich" corporationID="1753357224" corporationName="Vanishing Point." allianceID="1900696668" allianceName="The Initiative." factionID="0" factionName="" securityStatus="5" damageDone="325" finalBlow="0" weaponTypeID="17720" shipTypeID="17720" />
          <row characterID="911218672" characterName="Amadeus Baal" corporationID="98362681" corporationName="Project Valhalla." allianceID="1900696668" allianceName="The Initiative." factionID="0" factionName="" securityStatus="5" damageDone="0" finalBlow="0" weaponTypeID="3244" shipTypeID="34562" />
          <row characterID="94275007" characterName="Eduardo Bosch" corporationID="827059977" corporationName="Brothership Of EVE" allianceID="1900696668" allianceName="The Initiative." factionID="0" factionName="" securityStatus="4.6" damageDone="0" finalBlow="0" weaponTypeID="2921" shipTypeID="24700" />
          <row characterID="773254747" characterName="Fleshgrind" corporationID="773499566" corporationName="The Graduates" allianceID="1900696668" allianceName="The Initiative." factionID="0" factionName="" securityStatus="2.1" damageDone="0" finalBlow="0" weaponTypeID="4027" shipTypeID="37454" />
          <row characterID="93674139" characterName="Limyh Oteo" corporationID="773499566" corporationName="The Graduates" allianceID="1900696668" allianceName="The Initiative." factionID="0" factionName="" securityStatus="4.5" damageDone="0" finalBlow="0" weaponTypeID="5443" shipTypeID="627" />
        </rowset>
        <rowset name="items" columns="typeID,flag,qtyDropped,qtyDestroyed,singleton">
          <row typeID="13283" flag="89" qtyDropped="0" qtyDestroyed="1" singleton="0" />
          <row typeID="9956" flag="89" qtyDropped="0" qtyDestroyed="1" singleton="0" />
        </rowset>
      </row>
    EOS
  end
  let(:parser) { described_class.new(xml_row) }

  describe '#victim' do
    subject { parser.victim }

    describe 'keys' do
      specify 'character_id' do
        expect(subject.fetch(:character_id)).to eq(614389879)
      end

      specify 'character_name' do
        expect(subject.fetch(:character_name)).to eq('TROUB1')
      end

      specify 'corporation_id' do
        expect(subject.fetch(:corporation_id)).to eq(244898283)
      end

      specify 'corporation_name' do
        expect(subject.fetch(:corportaion_name)).to eq('OEG')
      end

      specify 'alliance_id' do
        expect(subject.fetch(:alliance_id)).to eq(99006227)
      end

      specify 'alliance_name' do
        expect(subject.fetch(:alliance_name)).to eq('Freedom Among the Stars')
      end

      specify 'faction_id' do
        expect(subject.fetch(:faction_id)).to eq(0)
      end

      specify 'ship_type_id' do
        expect(subject.fetch(:ship_type_id)).to eq(670)
      end

      specify 'damage_taken' do
        expect(subject.fetch(:damage_taken)).to eq(461)
      end
    end
  end

  describe '#attackers' do
    subject { parser.attackers }

    specify 'size' do
      expect(subject.size).to eq(6)
    end

    describe 'attacker' do
      subject { parser.attackers.first }

      describe 'keys' do
        specify 'character_id' do
          expect(subject.fetch(:character_id)).to eq(93235769)
        end

        specify 'character_name' do
          expect(subject.fetch(:character_name)).to eq('Ark Zxr')
        end

        specify 'corporationID' do
          expect(subject.fetch(:corporation_id)).to eq(497926671)
        end

        specify 'corporation_name' do
          expect(subject.fetch(:corporation_name)).to eq("Unleashed' Fury")
        end


        specify 'alliance_id' do
          expect(subject.fetch(:alliance_id)).to eq(1900696668)
        end

        specify 'alliance_name' do
          expect(subject.fetch(:alliance_name)).to eq('The Initiative.')
        end

        specify 'faction_id' do
          expect(subject.fetch(:faction_id)).to eq(0)
        end

        specify 'faction_name' do
          expect(subject.fetch(:faction_name)).to eq('')
        end

        specify 'security_status' do
          expect(subject.fetch(:security_status)).to eq(4.3038654000613)
        end

        specify 'damage_done' do
          expect(subject.fetch(:damage_done)).to eq(136)
        end

        specify 'final_blow' do
          expect(subject.fetch(:final_blow)).to eq(1)
        end

        specify 'weapon_type_id' do
          expect(subject.fetch(:weapon_type_id)).to eq(2873)
        end

        specify 'ship_type_id' do
          expect(subject.fetch(:ship_type_id)).to eq(22456)
        end
      end
    end
  end

  describe '#items' do
    subject { parser.items }

    specify 'size' do
      expect(subject.size).to eq(2)
    end

    describe 'item' do
      subject { parser.items.first }

      describe 'keys' do
        specify 'type_id' do
          expect(subject.fetch(:type_id)).to eq(13283)
        end

        specify 'flag' do
          expect(subject.fetch(:flag)).to eq(89)
        end

        specify 'qty_dropped' do
          expect(subject.fetch(:qty_dropped)).to eq(0)
        end

        specify 'qty_destroyed' do
          expect(subject.fetch(:qty_destroyed)).to eq(1)
        end

        specify 'singleton' do
          expect(subject.fetch(:singleton)).to eq(0)
        end
      end
    end
  end
end
