class Forecast < ActiveRecord::Base
  public

  def forecast_io
    forecast = ForecastIO.forecast(self.latitude, self.longitude, params: { units: 'si' })
    self.temperature = forecast.currently.temperature
    self.summary = forecast.currently.summary
    self.windSpeed = forecast.currently.windSpeed
  end
end
