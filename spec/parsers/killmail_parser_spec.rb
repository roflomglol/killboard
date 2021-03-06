require 'rails_helper'

RSpec.describe Parsers::KillmailParser do
  let(:killmail) { build(:killmail) }
  let(:parser) { described_class.new(killmail.body) }

  describe '#parse' do
    subject { parser.parse }

    it { is_expected.to be_a Hash }

    describe 'key :killed_at' do
      it 'must have a key :killed_at' do
        expect{ subject.fetch(:killed_at) }.not_to raise_error
      end

      it 'must be the killmail date' do
        expect(subject.fetch(:killed_at)).to eq('2016.07.02 19:12:41')
      end
    end

    describe 'key :victim' do
      it { is_expected.to have_key(:victim) }
    end

    describe 'key :involved_parties' do
      it { is_expected.to have_key(:involved_parties) }
      it 'must be an array of hashes' do
        expect(subject.fetch(:involved_parties)).to all(be_a Hash)
      end
    end

    describe 'key :destroyed_items' do
      it { is_expected.to have_key(:destroyed_items) }
      it 'must be an array of hashes' do
        expect(subject.fetch(:destroyed_items)).to all(be_a Hash)
      end
    end

    describe 'key :dropped_items' do
      it { is_expected.to have_key(:dropped_items) }
      it 'must be an array of hashes' do
        expect(subject.fetch(:dropped_items)).to all(be_a Hash)
      end
    end
  end
end
