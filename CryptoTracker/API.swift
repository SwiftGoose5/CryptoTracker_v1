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

enum Ticker: CaseIterable {
    case btc
    case eth
    case ltc
}

class BlockchainAPI {
    
    static func getCrypto(ticker: Ticker) async throws -> Crypto {
        var symbol = ""
        
        switch ticker {
        case .btc:
            symbol = "BTC-USD"
            
        case .eth:
            symbol = "ETH-USD"
            
        case .ltc:
            symbol = "LTC-USD"
        }
        
        guard let url = URL(string: "https://api.blockchain.com/v3/exchange/tickers/\(symbol)") else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidServerResponse
        }
        
        guard let crypto = try? JSONDecoder().decode(Crypto.self, from: data) else {
            throw APIError.invalidData
        }
        
        return crypto
    }
}
