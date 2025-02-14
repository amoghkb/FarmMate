class ApiModel {
  final double lat;
  final double lon;
  final String cityName;
  final double temp;
  final double pressure;
  final double humidity;
  final String weatherMain;
  final String weatherDescription;
  final double windSpeed;

  ApiModel({
    required this.lat,
    required this.lon,
    required this.cityName,
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.weatherMain,
    required this.weatherDescription,
    required this.windSpeed,
  });

  factory ApiModel.fromMap(Map<String, dynamic> map) {
    return ApiModel(
      lat: map['coord']['lat'].toDouble(),
      lon: map['coord']['lon'].toDouble(),
      cityName: map['name'],
      temp: map['main']['temp'].toDouble(),
      pressure: map['main']['pressure'].toDouble(),
      humidity: map['main']['humidity'].toDouble(),
      weatherMain: map['weather'][0]['main'],
      weatherDescription: map['weather'][0]['description'],
      windSpeed: map['wind']['speed'].toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lat': lat,
      'lon': lon,
      'cityName': cityName,
      'temp': temp,
      'pressure': pressure,
      'humidity': humidity,
      'weatherMain': weatherMain,
      'weatherDescription': weatherDescription,
      'windSpeed': windSpeed,
    };
  }
}
