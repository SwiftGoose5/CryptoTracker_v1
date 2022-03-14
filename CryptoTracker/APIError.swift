//
//
// CryptoTracker
//
// Created by Swift Goose on 3/11/22.
// Copyright (c) 2022 Swift Goose. All rights reserved.
//
// YouTube: https://www.youtube.com/channel/UCeHYBwcVqOoyyNHiAf3ZrLg
//


import Foundation

enum APIError: Error {
    case invalidURL
    case invalidServerResponse
    case invalidData
}

extension APIError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .invalidURL:
            return "Bad URL"
        case .invalidServerResponse:
            return "The server did not return 200"
        case .invalidData:
            return "The server returned bad data"
        }
    }
}
