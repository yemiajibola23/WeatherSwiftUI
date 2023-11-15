//
//  WeatherResponse.swift
//  WeatherSwiftUI
//
//  Created by Yemi Ajibola on 10/12/23.
//

import Foundation

/*
 {
     "lat": 33.44,
     "lon": -94.04,
     "timezone": "America/Chicago",
     "timezone_offset": -18000,
     ,
     "minutely": [
         {
             "dt": 1684929540,
             "precipitation": 0
         }
     ],
     "hourly": [
         {
             "dt": 1684926000,
             "temp": 292.01,
             "feels_like": 292.33,
             "pressure": 1014,
             "humidity": 91,
             "dew_point": 290.51,
             "uvi": 0,
             "clouds": 54,
             "visibility": 10000,
             "wind_speed": 2.58,
             "wind_deg": 86,
             "wind_gust": 5.88,
             "weather": [
                 {
                     "id": 803,
                     "main": "Clouds",
                     "description": "broken clouds",
                     "icon": "04n"
                 }
             ],
             "pop": 0.15
         }
     ],
     "daily": [
         {
             "dt": 1684951200,
             "sunrise": 1684926645,
             "sunset": 1684977332,
             "moonrise": 1684941060,
             "moonset": 1684905480,
             "moon_phase": 0.16,
             "summary": "Expect a day of partly cloudy with rain",
             "temp": {
                 "day": 299.03,
                 "min": 290.69,
                 "max": 300.35,
                 "night": 291.45,
                 "eve": 297.51,
                 "morn": 292.55
             },
             "feels_like": {
                 "day": 299.21,
                 "night": 291.37,
                 "eve": 297.86,
                 "morn": 292.87
             },
             "pressure": 1016,
             "humidity": 59,
             "dew_point": 290.48,
             "wind_speed": 3.98,
             "wind_deg": 76,
             "wind_gust": 8.92,
             "weather": [
                 {
                     "id": 500,
                     "main": "Rain",
                     "description": "light rain",
                     "icon": "10d"
                 }
             ],
             "clouds": 92,
             "pop": 0.47,
             "rain": 0.15,
             "uvi": 9.23
         }
     ],
     
 }
 */

struct WeatherResponse: Decodable {
    let lat: Double
    let lon: Double
    let timezone: String
    let timezoneOffset : Int
    let current: Current
    let minutely: [Minutely]
    let hourly: [Hourly]
    let daily: [Daily]
    let alerts: [Alerts]?
    
    enum CodingKeys: String, CodingKey {

        case lat = "lat"
        case lon = "lon"
        case timezone = "timezone"
        case timezoneOffset = "timezone_offset"
        case current = "current"
        case minutely = "minutely"
        case hourly = "hourly"
        case daily = "daily"
        case alerts = "alerts"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decode(Double.self, forKey: .lat)
        lon = try values.decode(Double.self, forKey: .lon)
        timezone = try values.decode(String.self, forKey: .timezone)
        timezoneOffset = try values.decode(Int.self, forKey: .timezoneOffset)
        current = try values.decode(Current.self, forKey: .current)
        minutely = try values.decode([Minutely].self, forKey: .minutely)
        hourly = try values.decode([Hourly].self, forKey: .hourly)
        daily = try values.decode([Daily].self, forKey: .daily)
        alerts = try values.decodeIfPresent([Alerts].self, forKey: .alerts)
    }
}

/*
 "alerts": [
     {
         "sender_name": "NWS Philadelphia - Mount Holly (New Jersey, Delaware, Southeastern Pennsylvania)",
         "event": "Small Craft Advisory",
         "start": 1684952747,
         "end": 1684988747,
         "description": "...SMALL CRAFT ADVISORY REMAINS IN EFFECT FROM 5 PM THIS\nAFTERNOON TO 3 AM EST FRIDAY...\n* WHAT...North winds 15 to 20 kt with gusts up to 25 kt and seas\n3 to 5 ft expected.\n* WHERE...Coastal waters from Little Egg Inlet to Great Egg\nInlet NJ out 20 nm, Coastal waters from Great Egg Inlet to\nCape May NJ out 20 nm and Coastal waters from Manasquan Inlet\nto Little Egg Inlet NJ out 20 nm.\n* WHEN...From 5 PM this afternoon to 3 AM EST Friday.\n* IMPACTS...Conditions will be hazardous to small craft.",
         "tags": []
     }
 ]
 */

struct Alerts: Codable {
    let sender: String
    let event: String
    let start: Int
    let end: Int
    let description: String
    let tags: [String]
    
    enum CodingKeys: String, CodingKey {
        case sender = "sender_name"
        case event = "event"
        case start = "start"
        case end = "end"
        case description = "description"
        case tags = "tags"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        sender = try values.decode(String.self, forKey: .sender)
        event = try values.decode(String.self, forKey: .event)
        start = try values.decode(Int.self, forKey: .start)
        end = try values.decode(Int.self, forKey: .end)
        description = try values.decode(String.self, forKey: .description)
        tags = try values.decode([String].self, forKey: .tags)
    }
}

/*
 "current": {
     "dt": 1684929490,
     "sunrise": 1684926645,
     "sunset": 1684977332,
     "temp": 292.55,
     "feels_like": 292.87,
     "pressure": 1014,
     "humidity": 89,
     "dew_point": 290.69,
     "uvi": 0.16,
     "clouds": 53,
     "visibility": 10000,
     "wind_speed": 3.13,
     "wind_deg": 93,
     "wind_gust": 6.71,
     "weather": [
         {
             "id": 803,
             "main": "Clouds",
             "description": "broken clouds",
             "icon": "04d"
         }
     ]
 }
 */

struct Current: Decodable {
    let dt: Int
    let sunrise: Int
    let sunset: Int
    let temp: Double
    let feelsLike: Double
    let pressure: Int
    let humidity: Int
    let dewPoint: Double
    let uvi: Double
    let clouds: Int
    let visibility: Int
    let windSpeed: Double
    let windDeg: Int
    let windGust: Double?
    let weather: [Weather]
    
    enum CodingKeys: String, CodingKey {
        
        case dt = "dt"
        case sunrise = "sunrise"
        case sunset = "sunset"
        case temp = "temp"
        case feelsLike = "feels_like"
        case pressure = "pressure"
        case humidity = "humidity"
        case dewPoint = "dew_point"
        case uvi = "uvi"
        case clouds = "clouds"
        case visibility = "visibility"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather = "weather"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dt = try values.decode(Int.self, forKey: .dt)
        sunrise = try values.decode(Int.self, forKey: .sunrise)
        sunset = try values.decode(Int.self, forKey: .sunset)
        temp = try values.decode(Double.self, forKey: .temp)
        feelsLike = try values.decode(Double.self, forKey: .feelsLike)
        pressure = try values.decode(Int.self, forKey: .pressure)
        humidity = try values.decode(Int.self, forKey: .humidity)
        dewPoint = try values.decode(Double.self, forKey: .dewPoint)
        uvi = try values.decode(Double.self, forKey: .uvi)
        clouds = try values.decode(Int.self, forKey: .clouds)
        visibility = try values.decode(Int.self, forKey: .visibility)
        windSpeed = try values.decode(Double.self, forKey: .windSpeed)
        windDeg = try values.decode(Int.self, forKey: .windDeg)
        windGust = try values.decodeIfPresent(Double.self, forKey: .windGust)
        weather = try values.decode([Weather].self, forKey: .weather)
    }
}

struct Minutely: Decodable {
    let dt: Int
    let precipitation: Int

    enum CodingKeys: String, CodingKey {
        case dt = "dt"
        case precipitation = "precipitation"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dt = try values.decode(Int.self, forKey: .dt)
        precipitation = try values.decode(Int.self, forKey: .precipitation)
    }
}

/*
 "hourly": [
     {
         "dt": 1684926000,
         "temp": 292.01,
         "feels_like": 292.33,
         "pressure": 1014,
         "humidity": 91,
         "dew_point": 290.51,
         "uvi": 0,
         "clouds": 54,
         "visibility": 10000,
         "wind_speed": 2.58,
         "wind_deg": 86,
         "wind_gust": 5.88,
         "weather": [
             {
                 "id": 803,
                 "main": "Clouds",
                 "description": "broken clouds",
                 "icon": "04n"
             }
         ],
         "pop": 0.15
     }
 ]
 */

struct Hourly: Decodable {
    let dt : Int
    let temp : Double
    let feelsLike : Double
    let pressure : Int
    let humidity : Int
    let dewPoint : Double
    let uvi : Double
    let clouds : Int
    let visibility : Int
    let wind_speed : Double
    let wind_deg : Int
    let wind_gust : Double
    let weather : [Weather]
    let pop : Double

    enum CodingKeys: String, CodingKey {

        case dt = "dt"
        case temp = "temp"
        case feelsLike = "feels_like"
        case pressure = "pressure"
        case humidity = "humidity"
        case dewPoint = "dew_point"
        case uvi = "uvi"
        case clouds = "clouds"
        case visibility = "visibility"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case windGust = "wind_gust"
        case weather = "weather"
        case pop = "pop"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dt = try values.decode(Int.self, forKey: .dt)
        temp = try values.decode(Double.self, forKey: .temp)
        feelsLike = try values.decode(Double.self, forKey: .feelsLike)
        pressure = try values.decode(Int.self, forKey: .pressure)
        humidity = try values.decode(Int.self, forKey: .humidity)
        dewPoint = try values.decode(Double.self, forKey: .dewPoint)
        uvi = try values.decode(Double.self, forKey: .uvi)
        clouds = try values.decode(Int.self, forKey: .clouds)
        visibility = try values.decode(Int.self, forKey: .visibility)
        wind_speed = try values.decode(Double.self, forKey: .windSpeed)
        wind_deg = try values.decode(Int.self, forKey: .windDeg)
        wind_gust = try values.decode(Double.self, forKey: .windGust)
        weather = try values.decode([Weather].self, forKey: .weather)
        pop = try values.decode(Double.self, forKey: .pop)
    }
}

struct Daily: Decodable {
    let dt: Int
    let sunrise: Int
    let sunset: Int
    let moonrise: Int
    let moonset: Int
    let moon_phase: Double
    let summary: String
    let temp: Temp
    let feelsLike: FeelsLike
    let pressure: Int
    let humidity: Int
    let dew_point: Double
    let wind_speed: Double
    let wind_deg: Int
    let wind_gust: Double
    let weather: [Weather]
    let clouds: Int
    let pop: Double
    let rain: Double?
    let uvi: Double

    enum CodingKeys: String, CodingKey {

        case dt = "dt"
        case sunrise = "sunrise"
        case sunset = "sunset"
        case moonrise = "moonrise"
        case moonset = "moonset"
        case moon_phase = "moon_phase"
        case summary = "summary"
        case temp = "temp"
        case feels_like = "feels_like"
        case pressure = "pressure"
        case humidity = "humidity"
        case dew_point = "dew_point"
        case wind_speed = "wind_speed"
        case wind_deg = "wind_deg"
        case wind_gust = "wind_gust"
        case weather = "weather"
        case clouds = "clouds"
        case pop = "pop"
        case rain = "rain"
        case uvi = "uvi"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        dt = try values.decode(Int.self, forKey: .dt)
        sunrise = try values.decode(Int.self, forKey: .sunrise)
        sunset = try values.decode(Int.self, forKey: .sunset)
        moonrise = try values.decode(Int.self, forKey: .moonrise)
        moonset = try values.decode(Int.self, forKey: .moonset)
        moon_phase = try values.decode(Double.self, forKey: .moon_phase)
        summary = try values.decode(String.self, forKey: .summary)
        temp = try values.decode(Temp.self, forKey: .temp)
        feelsLike = try values.decode(FeelsLike.self, forKey: .feels_like)
        pressure = try values.decode(Int.self, forKey: .pressure)
        humidity = try values.decode(Int.self, forKey: .humidity)
        dew_point = try values.decode(Double.self, forKey: .dew_point)
        wind_speed = try values.decode(Double.self, forKey: .wind_speed)
        wind_deg = try values.decode(Int.self, forKey: .wind_deg)
        wind_gust = try values.decode(Double.self, forKey: .wind_gust)
        weather = try values.decode([Weather].self, forKey: .weather)
        clouds = try values.decode(Int.self, forKey: .clouds)
        pop = try values.decode(Double.self, forKey: .pop)
        rain = try values.decodeIfPresent(Double.self, forKey: .rain)
        uvi = try values.decode(Double.self, forKey: .uvi)
    }
}

struct Temp: Codable {
    let day: Double
    let min: Double
    let max: Double
    let night: Double
    let eve: Double
    let morn: Double

    enum CodingKeys: String, CodingKey {

        case day = "day"
        case min = "min"
        case max = "max"
        case night = "night"
        case eve = "eve"
        case morn = "morn"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        day = try values.decode(Double.self, forKey: .day)
        min = try values.decode(Double.self, forKey: .min)
        max = try values.decode(Double.self, forKey: .max)
        night = try values.decode(Double.self, forKey: .night)
        eve = try values.decode(Double.self, forKey: .eve)
        morn = try values.decode(Double.self, forKey: .morn)
    }

}

struct FeelsLike: Codable {
    let day: Double
    let night: Double
    let eve: Double
    let morn: Double

    enum CodingKeys: String, CodingKey {

        case day = "day"
        case night = "night"
        case eve = "eve"
        case morn = "morn"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        day = try values.decode(Double.self, forKey: .day)
        night = try values.decode(Double.self, forKey: .night)
        eve = try values.decode(Double.self, forKey: .eve)
        morn = try values.decode(Double.self, forKey: .morn)
    }

}

struct Coord: Decodable {
    var latitude: Double
    var longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lon"
    }
}



struct Weather: Decodable, Identifiable {
    var id: Int
    var main: String
    var description: String
    var icon: String
    
    enum CodingKeys: String, CodingKey {

        case id = "id"
        case main = "main"
        case description = "description"
        case icon = "icon"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        main = try values.decode(String.self, forKey: .main)
        description = try values.decode(String.self, forKey: .description)
        icon = try values.decode(String.self, forKey: .icon)
    }
}
