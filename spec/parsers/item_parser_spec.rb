require 'rails_helper'

RSpec.describe Parsers::ItemParser do

  let(:basic_item) { 'Gist X-Type X-Large Shield Booster' }
  let(:parser) { described_class.new }

  describe '#parse' do
    subject { parser.parse(basic_item) }

    it { is_expected.to be_a Hash }

    describe 'key :item' do
      subject { parser.parse(basic_item).fetch(:item) }

      it { is_expected.to eq('Gist X-Type X-Large Shield Booster') }
    end

    describe 'key :qty' do
      subject { parser.parse(item).fetch(:qty) }

      context 'individual item' do
        let(:item) { basic_item }

        it { is_expected.to eq(nil) }
      end
      context 'quantitative item' do
        let(:item) { 'Mjolnir Fury Cruise Missile, Qty: 15' }

        it { is_expected.to eq('15') }
      end
    end

    describe 'key :position' do
      subject { parser.parse(item).fetch(:position) }

      context 'fitted item' do
        let (:item) { basic_item }

        it { is_expected.to eq(:fitted) }
      end

      context 'item in cargo' do
        let (:item) { 'Nanite Repair Paste, Qty: 55 (Cargo)' }

        it { is_expected.to eq(:cargo) }
      end

      context 'item in drone bay' do
        let (:item) { 'Warrior II, Qty: 4 (Drone Bay)' }

        it { is_expected.to eq(:drone_bay) }
      end
    end
  end
end
