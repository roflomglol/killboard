require 'rails_helper'

RSpec.describe Killmail::VictimParser do
  let(:victim_raw) do
    <<~EOS
      Victim: Forsaken Skipper
      Corp: OEG
      Alliance: Freedom Among the Stars
      Faction: None
      Destroyed: Talos
      System: N-M1A3
      Security: 0.0
      Damage Taken: 17215
    EOS
  end

  let(:parser) { described_class.new }

  describe '#parse' do
    subject { parser.parse(victim_raw) }

    it { is_expected.to be_a Hash }

    describe ':victim' do
      it { is_expected.to have_key(:victim) }

      it "must be the victim's name" do
        expect(subject.fetch(:victim)).to eq('Forsaken Skipper')
      end
    end

    describe ':corp' do
      it { is_expected.to have_key(:corp) }

      it "must be the victim's corporation" do
        expect(subject.fetch(:corp)).to eq('OEG')
      end
    end

    describe ':alliance' do
      it { is_expected.to have_key(:alliance) }

      it "must be the victim's corporation alliance" do
        expect(subject.fetch(:alliance)).to eq('Freedom Among the Stars')
      end
    end

    describe ':faction' do
      it { is_expected.to have_key(:faction) }

      it "must be the victim's faction" do
        expect(subject.fetch(:faction)).to eq('None')
      end
    end

    describe ':destroyed' do
      it { is_expected.to have_key(:destroyed) }

      it "must be the victim's destroyed ship" do
        expect(subject.fetch(:destroyed)).to eq('Talos')
      end
    end

    describe ':system' do
      it { is_expected.to have_key(:system) }

      it "must be the system where victim was killed" do
        expect(subject.fetch(:system)).to eq('N-M1A3')
      end
    end

    describe ':security' do
      it { is_expected.to have_key(:security) }

      it "must be the security level of system  where victim was killed" do
        expect(subject.fetch(:security)).to eq('0.0')
      end
    end

    describe ':damage_taken' do
      it { is_expected.to have_key(:damage_taken) }

      it "must be the damage taken by victim" do
        expect(subject.fetch(:damage_taken)).to eq('17215')
      end
    end
  end
end
