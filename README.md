Seresco Weather Utils iOS
=======

A weather library for iOS using AEMET data

<p float="left">
  <img src="art/img_weather_weekly.png" width="200" height="450">
  <img src="art/img_weather_tomorrow.png" width="200" height="450">
  <img src="art/img_precipitation.png" width="200" height="450">
  <img src="art/img_options.png" width="200" height="450">
</p>


Usage
--------

e.g. Displaying Weekly Weather Info

```swift
import SerescoWeatherUtils


let meteorologyUtils = MeteorologyUtils()

func openWeatherWeeklySheet() {
    meteorologyUtils.currentViewController = self
    meteorologyUtils.openMeteorologyPanel(meteorologyType: .WEATHER_WEEKLY, coordinate: CLLocationCoordinate2D(latitude: 43.361231, longitude: -5.848566,))
}
```

Installation
--------

Cooming soon
