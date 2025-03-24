require 'rails_helper'

RSpec.describe 'Routing', type: :routing do
  describe 'Assessments' do
    it { is_expected.to route(:get, 'weather').to 'weather#index' }
    it { is_expected.to route(:get, 'weather/forecast').to 'weather#forecast' }
  end
end
