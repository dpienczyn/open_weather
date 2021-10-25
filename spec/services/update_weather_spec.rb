require 'rails_helper'

RSpec.describe UpdateWeather do
  subject(:update_weather) do
    described_class.call(weather: weather)
  end

  describe 'when city is valid' do
    let(:weather) { create(:weather) }

    it { is_expected.to be_success }
  end
end
