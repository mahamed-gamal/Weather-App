



import Foundation

// MARK: - WelcomeElement
struct WelcomeElement: Codable {
    let id: Int
    let name, country: String
    let coord: Coord
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

typealias Welcome = [WelcomeElement]
