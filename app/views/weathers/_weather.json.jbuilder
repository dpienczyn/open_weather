json.extract! weather, :id, :city, :note, :created_at, :updated_at
json.url weather_url(weather, format: :json)
