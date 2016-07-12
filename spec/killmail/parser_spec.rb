require 'rails_helper'

RSpec.describe Killmail::Parser do
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
  end
end
