require 'rails_helper'

RSpec.describe Parsers::InvolvedPartiesParser do
  let(:involved_parties) do
    <<~EOS
      Name: Blood Monsignor / Blood Raiders
      Damage Done: 8033

      Name: Vaas Edo (laid the final blow)
      Security: 5.0
      Corp: Fatal Talocan
      Alliance: I N G L O R I O U S
      Faction: None
      Ship: Nightmare
      Weapon: Mega Pulse Laser II
      Damage Done: 5201

      Name: T00NCES
      Security: 5.0
      Corp: Fatal Talocan
      Alliance: I N G L O R I O U S
      Faction: None
      Ship: Tempest
      Weapon: Ogre II
      Damage Done: 2709

      Name: adam b
      Security: 5.0
      Corp: Fatal Talocan
      Alliance: I N G L O R I O U S
      Faction: None
      Ship: Tempest
      Weapon: Hammerhead II
      Damage Done: 1272

      Name: Mr Joe Black
      Security: 5.0
      Corp: Fatal Talocan
      Alliance: I N G L O R I O U S
      Faction: None
      Ship: Phobos
      Weapon: True Sansha Warp Disruption Field Generator
      Damage Done: 0
    EOS
  end

  let(:parser) { described_class.new }

  describe '#parse' do
    subject { parser.parse(involved_parties) }

    it { is_expected.to be_an Array }
    it 'it must contain 5 elements' do
      expect(subject.size).to eq(5)
    end
  end
end
