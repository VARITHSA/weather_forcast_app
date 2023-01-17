class WeatherData {
  var cityName;
  var minTemp;
  var maxTemp;
  var pressure;
  var description;
  var winSpeevar;
  var latitude;
  var longitude;
  var temp;
  var main;
  var sunrise;
  var sunset;
  var zone;
  var icon;
  WeatherData({
    this.cityName,
    this.minTemp,
    this.maxTemp,
    this.pressure,
    this.description,
    this.winSpeevar,
    this.latitude,
    this.longitude,
    this.temp,
    this.main,
    this.sunrise,
    this.sunset,
    this.zone,
    this.icon,
  });
  WeatherData.fromJson(Map<String, dynamic> json) {
    longitude = json['coord']['lon'];
    latitude = json['coord']['lat'];
    temp = json['main']['temp'];
    minTemp = json['main']['temp_min'];
    maxTemp = json['main']['temp_max'];
    pressure = json['main']['pressure'];
    cityName = json['name'];
    main = json['weather'][0]['main'];
    description = json['weather'][0]['description'];
    zone = json['timezone'];
    sunrise = json['sys']['sunrise'];
    sunset = json['sys']['sunset'];
    icon = json['weather'][0]['icon'];
  }
}
