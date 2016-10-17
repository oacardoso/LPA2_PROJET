 json.extract! forecast, :id, :latitude, :longitude, :summary, :temperature, :windSpeed, :created_at, :updated_at
json.url forecast_url(forecast, format: :json)