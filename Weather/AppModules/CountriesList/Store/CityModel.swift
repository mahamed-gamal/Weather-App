



import Foundation

// MARK: - WelcomeElement
struct CityModel: Codable {
    let id: Int
    let name, country: String
    let coord: Coordinaties
}

// MARK: - Coord
struct Coordinaties: Codable {
    let lon, lat: Double
}

typealias Cities = [CityModel]
