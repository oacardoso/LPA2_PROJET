class CreateForecasts < ActiveRecord::Migration
  def change
    create_table :forecasts do |t|
      t.float :latitude
      t.float :longitude
      t.string :summary
      t.float :temperature
      t.float :windSpeed

      t.timestamps
    end
  end
end
