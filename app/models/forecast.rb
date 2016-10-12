class Forecast < ActiveRecord::Base
    before_create :forcast_io
  private

  def forecast_io
    forecast = ForecastIO.forecast(self.latitude, self.longitude, params: { units: 'si' })
    self.temperature = forecast.temperature
    self.summary = forecast.summary
    self.windspeed = forecast.windspeed
  end
end
