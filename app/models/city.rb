class City < ActiveRecord::Base
  before_create :geocode
  public

  def forecast_io
    forecast = ForecastIO.forecast(self.lat, self.lon, params: { units: 'si' })
    self.temperature = forecast.currently.temperature
    self.summary = forecast.currently.summary
    self.windSpeed = forecast.currently.windSpeed
  end

  def geocode
    places = Nominatim.search.city(self.name).limit(1)
    self.lat = places.first.lat
    self.lon = places.first.lon
  end


end
