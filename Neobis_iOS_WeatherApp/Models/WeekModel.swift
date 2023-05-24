// MARK: - Welcome
struct weekWelcome: Codable {
    let cod: String
    let message, cnt: Int
    let list: [weekList]
    let city: weekCity
}

// MARK: - City
struct weekCity: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population, timezone, sunrise, sunset: Int
}

// MARK: - Coord
struct weekCoord: Codable {
    let lat, lon: Double
}

/// MARK: - List
struct weekList: Codable {
    let dt: Int
    let main: weekMainClass
    let weather: [weekWeather]
    let clouds: weekClouds
    let wind: weekWind
    let visibility: Int
    let pop: Double
    let sys: weekSys?
    let dtTxt: String
    let rain: Rain?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop, sys
        case dtTxt = "dt_txt"
        case rain
    }
}


// MARK: - Clouds
struct weekClouds: Codable {
    let all: Int
}

// MARK: - MainClass
struct weekMainClass: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, seaLevel, grndLevel, humidity: Int
    let tempKf: Double

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - Rain
typealias Rain = [String: Double]

// MARK: - Sys
struct weekSys: Codable {
    let pod: Pod
}

enum Pod: String, Codable {
    case d = "d"
    case n = "n"
}

// MARK: - Weather
struct weekWeather: Codable {
    let id: Int
    let main: weekMainEnum
    let description: weekDescription
    let icon: String
}

enum weekDescription: String, Codable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case lightRain = "light rain"
    case overcastClouds = "overcast clouds"
    case scatteredClouds = "scattered clouds"
}

enum weekMainEnum: String, Codable {
    case clear = "Clear"
    case clouds = "Clouds"
    case rain = "Rain"
}

// MARK: - Wind
struct weekWind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}
