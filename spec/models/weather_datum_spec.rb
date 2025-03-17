require 'rails_helper'

RSpec.describe WeatherDatum, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:zipcode) }
    it { should validate_uniqueness_of(:zipcode) }
    it { should validate_presence_of(:data) }
    it { should validate_presence_of(:expires_at) }
  end
end
