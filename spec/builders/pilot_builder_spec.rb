require 'rails_helper'

RSpec.describe Builders::PilotBuilder do
  let(:builder) { Builders::PilotBuilder.new }
  let(:pilot_name) { attributes_for(:pilot).fetch(:name) }
  let(:origin_id) { attributes_for(:pilot).fetch(:origin_id) }

  describe '#build' do
    subject { described_class.build {} }

    it { is_expected.to be_a Pilot }
  end

  describe '#set_name' do
    subject do
      described_class.build do |b|
        b.set_name(pilot_name)
      end
    end

    it "sets pilot's name" do
      expect(subject.name).to eq(pilot_name)
    end
  end

  describe '#set_origin_id' do
    subject do
      described_class.build do |b|
        b.set_origin_id(origin_id)
      end
    end

    it "sets pilot's origin_id" do
      expect(subject.origin_id).to eq(origin_id)
    end
  end
end
