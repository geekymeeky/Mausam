import 'package:mausam/services/location.dart';
import 'package:mausam/services/networking.dart';

const API_KEY = '4a79eaddd3628432d53934843f3414c5';
const API_URI = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Locator location = Locator();
    await location.getCurrentLocation();

    NetworkHandler networkHelper = NetworkHandler(Uri.parse(
        '$API_URI?lat=${location.latitude}&lon=${location.longitude}&appid=$API_KEY&units=metric'));

    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}
