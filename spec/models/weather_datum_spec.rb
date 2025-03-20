require 'rails_helper'

RSpec.describe WeatherDatum, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:zipcode) }
    it { should validate_uniqueness_of(:zipcode) }
    it { should validate_presence_of(:data) }
  end

  describe '#get_by_zipcode' do
    subject { described_class.get_by_zipcode(zipcode) }

    let(:zipcode) { "12345" }

    context "with valid cached data" do
      before do
        FactoryBot.create :weather_datum, zipcode: zipcode, created_at: Time.now
      end

      it { expect(JSON.parse(subject.data)['temp']).to eq 62.44 }
    end

    context "with expired cached data" do
      before do
        FactoryBot.create :weather_datum, zipcode: zipcode, created_at: 31.minutes.ago
      end

      it { expect(subject).to be_nil }
      it { expect { subject }.to change { WeatherDatum.count }.by -1 }
    end
  end
end
