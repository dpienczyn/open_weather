class WeathersController < ApplicationController
before_action :set_weather, only: %i[ edit update destroy ]

  def index
    @weathers = Weather.all
  end

  def new
    @weather = Weather.new
  end

  def edit
  end

  def create
    @weather = Weather.new(weather_params)
    @weather.user_id = current_user.id

    if @weather.save
      GetWeather.call(weather: @weather)

      redirect_to weathers_url, notice: "Zakończono sukcesem."
    end
  end

  def update
    if @weather.user_id == current_user.id && @weather.update(weather_params)
      UpdateWeather.call(weather: @weather)

      redirect_to weathers_url, notice: "Zakończono sukcesem."
    else
      redirect_to weathers_url, notice: "Zapis się nie powiódł."
    end
  end

  def destroy
    if @weather.user_id == current_user.id
      @weather.destroy
      redirect_to weathers_url, notice: "Zakończono sukcesem."
    else
      redirect_to weathers_url, notice: "Nie jesteś właścicielem tych wpisów!"
    end
  end

  private

  def set_weather
    @weather = Weather.find(params[:id])
  end

  def weather_params
    params.require(:weather).permit(:city, :note, :temp)
  end
end
