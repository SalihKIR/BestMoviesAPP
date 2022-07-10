import Foundation

// MARK: - MoveAPI5Element
struct MoveAPI5Element: Codable {
    let movie: String
    let year: Int
    let releaseDate, director, character, movieDuration: String
    let timestamp, fullLine: String
    let currentWowInMovie, totalWowsInMovie: Int
    let poster: String
    let video: String
    let audio: String

    enum CodingKeys: String, CodingKey {
        case movie, year
        case releaseDate = "release_date"
        case director, character
        case movieDuration = "movie_duration"
        case timestamp
        case fullLine = "full_line"
        case currentWowInMovie = "current_wow_in_movie"
        case totalWowsInMovie = "total_wows_in_movie"
        case poster, video, audio
    }
}

typealias MoveAPI5 = [MoveAPI5Element]

import Foundation

// MARK: - RandomResponseElement
struct RandomResponseElement: Codable {
    let movie: String
    let year: Int
    let releaseDate, director, character, movieDuration: String
    let timestamp, fullLine: String
    let currentWowInMovie, totalWowsInMovie: Int
    let poster: String
    let video: Video
    let audio: String

    enum CodingKeys: String, CodingKey {
        case movie, year
        case releaseDate = "release_date"
        case director, character
        case movieDuration = "movie_duration"
        case timestamp
        case fullLine = "full_line"
        case currentWowInMovie = "current_wow_in_movie"
        case totalWowsInMovie = "total_wows_in_movie"
        case poster, video, audio
    }
}

// MARK: - Video
struct Video: Codable {
    let the1080P, the720P, the480P, the360P: String

    enum CodingKeys: String, CodingKey {
        case the1080P = "1080p"
        case the720P = "720p"
        case the480P = "480p"
        case the360P = "360p"
    }
}

typealias RandomResponse = [RandomResponseElement]


import Foundation

// MARK: - RandomoneMovieElement
struct RandomoneMovieElement: Codable {
    let movie: String
    let year: Int
    let releaseDate, director, character, movieDuration: String
    let timestamp, fullLine: String
    let currentWowInMovie, totalWowsInMovie: Int
    let poster: String
    let video: Video
    let audio: String

    enum CodingKeys: String, CodingKey {
        case movie, year
        case releaseDate = "release_date"
        case director, character
        case movieDuration = "movie_duration"
        case timestamp
        case fullLine = "full_line"
        case currentWowInMovie = "current_wow_in_movie"
        case totalWowsInMovie = "total_wows_in_movie"
        case poster, video, audio
    }
}

typealias RandomoneMovie = [RandomoneMovieElement]

import Foundation

// MARK: - AllMovieElement
struct AllMovieElement: Codable {
    let movie: String
    let year: Int
    let releaseDate, director, character, movieDuration: String
    let timestamp, fullLine: String
    let currentWowInMovie, totalWowsInMovie: Int
    let poster: String
    let video: Video
    let audio: String

    enum CodingKeys: String, CodingKey {
        case movie, year
        case releaseDate = "release_date"
        case director, character
        case movieDuration = "movie_duration"
        case timestamp
        case fullLine = "full_line"
        case currentWowInMovie = "current_wow_in_movie"
        case totalWowsInMovie = "total_wows_in_movie"
        case poster, video, audio
    }
}


typealias AllMovie = [AllMovieElement]

import Foundation

// MARK: - AllMovieNew
struct AllMovieNew: Codable {
    let search: [Search]
    let totalResults, response: String

    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case totalResults
        case response = "Response"
    }
}

// MARK: - Search
struct Search: Codable {
    let title, year, imdbID: String
    let type: TypeEnum
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}

enum TypeEnum: String, Codable {
    case movie = "movie"
    case series = "series"
}
