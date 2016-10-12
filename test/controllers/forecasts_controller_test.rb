require 'test_helper'

class ForecastsControllerTest < ActionController::TestCase
  setup do
    @forecast = forecasts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forecasts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create forecast" do
    VCR.use_cassette("forecast_io") do
      assert_difference('Forecast.count') do
        post :create, forecast: { latitude: @forecast.latitude, longitude: @forecast.longitude, summary: @forecast.summary, temperature: @forecast.temperature, windSpeed: @forecast.windSpeed }
      end
   end
    assert_redirected_to forecast_path(assigns(:forecast))
  end

  test "should show forecast" do
    get :show, id: @forecast
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @forecast
    assert_response :success
  end

  test "should update forecast" do
    VCR.use_cassette("forecast_io") do
      patch :update, id: @forecast, forecast: { latitude: @forecast.latitude, longitude: @forecast.longitude, summary: @forecast.summary, temperature: @forecast.temperature, windSpeed: @forecast.windSpeed }
      assert_redirected_to forecast_path(assigns(:forecast))
    end
  end

  test "should destroy forecast" do
    assert_difference('Forecast.count', -1) do
      delete :destroy, id: @forecast
    end

    assert_redirected_to forecasts_path
  end
end
