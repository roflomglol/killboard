require 'rails_helper'

RSpec.describe Parsers::InvolvedPartyParser do
  let(:involved_party) do
    <<~EOS
      Name: Alestraza (laid the final blow)
      Security: -1.2
      Corp: Tempus Stabilis
      Alliance: LowSechnaya Sholupen
      Faction: None
      Ship: Hurricane
      Weapon: 220mm Vulcan AutoCannon II
      Damage Done: 3323
    EOS
  end

  let(:parser) { described_class.new }

  describe '#parse' do
    context 'involved party is a pilot' do
      subject { parser.parse(involved_party) }

      it { is_expected.to be_a Hash }

      describe 'key :name' do
        it "must be the pilot's name" do
          expect(subject.fetch(:name)).to eq('Alestraza')
        end
      end

      describe 'key :security' do
        it "must be the pilot's security" do
          expect(subject.fetch(:security)).to eq('-1.2')
        end
      end

      describe 'key :corp' do
        it "must be the pilot's corporation" do
          expect(subject.fetch(:corp)).to eq('Tempus Stabilis')
        end
      end

      describe 'key :alliance' do
        it "must be the pilot's alliance" do
          expect(subject.fetch(:alliance)).to eq('LowSechnaya Sholupen')
        end
      end

      describe 'key :faction' do
        it "must be the pilot's faction" do
          expect(subject.fetch(:faction)).to eq('None')
        end
      end

      describe 'key :ship' do
        it "must be the pilot's ship" do
          expect(subject.fetch(:ship)).to eq('Hurricane')
        end
      end

      describe 'key :weapon' do
        it "must be the pilot's weapon" do
          expect(subject.fetch(:weapon)).to eq('220mm Vulcan AutoCannon II')
        end
      end

      describe 'key :damage_done' do
        it "must be the pilot's damage done" do
          expect(subject.fetch(:damage_done)).to eq('3323')
        end
      end

      describe 'key :laid_the_final_blow' do
        it 'must be true if pilot laid the final blow' do
          expect(subject.fetch(:laid_the_final_blow)).to be true
        end
      end
    end
  end
end
