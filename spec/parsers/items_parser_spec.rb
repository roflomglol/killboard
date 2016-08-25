require 'rails_helper'

RSpec.describe Parsers::ItemsParser do
  let(:items) do
    <<~EOS
      Republic Fleet Fusion L, Qty: 2000 (Cargo)
      Republic Fleet Depleted Uranium L, Qty: 1839 (Cargo)
      Damage Control II
      Gyrostabilizer II
      Gyrostabilizer II
      Tracking Enhancer II
      500MN Quad LiF Restrained Microwarpdrive
      1400mm 'Scout' Artillery I
      1400mm 'Scout' Artillery I
      Republic Fleet Depleted Uranium L, Qty: 19
      Republic Fleet Depleted Uranium L, Qty: 19
      1400mm 'Scout' Artillery I
      1400mm 'Scout' Artillery I
      1400mm 'Scout' Artillery I
      Large YF-12a Smartbomb
    EOS
  end

  let(:parser) { described_class.new }

  describe '#parse' do
    subject { parser.parse(items) }

    it { is_expected.to be_an Array }
    it 'it must contain 5 elements' do
      expect(subject.size).to eq(15)
    end
  end
end
