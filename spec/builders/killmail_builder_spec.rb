require 'rails_helper'

RSpec.describe Builders::KillmailBuilder, :focus do
  let(:victim) { build(:pilot) }

  describe '#build' do
    subject { described_class.build {} }

    it { is_expected.to be_a Killmail }
  end

  describe '#set_victim' do
    subject do
      described_class.build do |b|
        b.set_victim(victim)
      end
    end

    it "sets pilot's name" do
      expect(subject.victim).to eq(victim)
    end
  end
end
