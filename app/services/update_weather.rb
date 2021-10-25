class UpdateWeather < ApplicationService
  def initialize(weather:)
    @weather = weather
  end

  def call
    ActiveRecord::Base.transaction do
      update_weather
    end

    Success.new(result: weather)
  end

  attr_reader :weather

  def api
    @api = Faraday.get(
      "http://api.openweathermap.org/data/2.5/weather?q=#{weather.city}&appid=#{ENV['APP_ID']}"
    ).body
  end

  def update_weather
    weather_data = JSON.parse(api, object_class: OpenStruct)

    if weather_data.cod != '404'
      weather.temp = weather_data.main.temp.to_f
      weather.save!
    end
  end
end
