require "rails_helper"

RSpec.describe Weather, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "ActiveModel validations" do
    it { is_expected.to validate_presence_of(:city) }
  end

  describe "#phone_format" do
    context 'when temp is valid' do
      let(:weather) { build(:weather, temp: 291.20) }

      it { expect(Weather.to_celcius(weather.temp)).to eq(18) }
    end

    context 'when temp is invalid' do
      let(:weather) { build(:weather, temp: nil) }

      it { expect(Weather.to_celcius(weather.temp)).to eq(0) }
    end
  end
end
