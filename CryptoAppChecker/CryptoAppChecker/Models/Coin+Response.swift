//
//  Coin+Response.swift
//  CryptoAppChecker
//
//  Created by Diachenko Ihor on 23.07.2022.
//

import Foundation

extension Coin {
    struct Response: Identifiable, Codable {
        let id, symbol, name: String
        let image: String
        let currentPrice: Double
        let marketCapRank: Int?
        let marketCap, fullyDilutedValuation: Double?
        let totalVolume, high24H, low24H: Double?
        let priceChange24H, priceChangePercentage24H, marketCapChange24H, marketCapChangePercentage24H: Double?
        let circulatingSupply, totalSupply, maxSupply, ath: Double?
        let athChangePercentage: Double?
        let athDate: String?
        let atl, atlChangePercentage: Double?
        let atlDate: String?
        let lastUpdated: String?
        let sparklineIn7D: SparklineIn7D?
        let priceChangePercentage24HInCurrency: Double?
        
        enum CodingKeys: String, CodingKey {
                case id, symbol, name, image, ath, atl
                case currentPrice = "current_price"
                case marketCap = "market_cap"
                case marketCapRank = "market_cap_rank"
                case fullyDilutedValuation = "fully_diluted_valuation"
                case totalVolume = "total_volume"
                case high24H = "high_24h"
                case low24H = "low_24h"
                case priceChange24H = "price_change_24h"
                case priceChangePercentage24H = "price_change_percentage_24h"
                case marketCapChange24H = "market_cap_change_24h"
                case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
                case circulatingSupply = "circulating_supply"
                case totalSupply = "total_supply"
                case maxSupply = "max_supply"
                case athChangePercentage = "ath_change_percentage"
                case athDate = "ath_date"
                case atlChangePercentage = "atl_change_percentage"
                case atlDate = "atl_date"
                case lastUpdated = "last_updated"
                case sparklineIn7D = "sparkline_in_7d"
                case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
            }
    }
    
    struct SparklineIn7D: Codable {
        let price: [Double]?
    }
    
    init(from response: Response) {
        self.id = response.id
        self.symbol = response.symbol
        self.name = response.name
        self.image = response.image
        self.currentPrice = response.currentPrice
        self.marketCap = response.marketCap
        self.marketCapRank = response.marketCapRank ?? 0
        self.fullyDilutedValuation = response.fullyDilutedValuation
        self.totalVolume = response.totalVolume
        self.high24H = response.high24H
        self.low24H = response.low24H
        self.priceChange24H = response.priceChange24H
        self.priceChangePercentage24H = response.priceChangePercentage24H
        self.marketCapChange24H = response.marketCapChange24H
        self.marketCapChangePercentage24H = response.marketCapChangePercentage24H
        self.circulatingSupply = response.circulatingSupply
        self.totalSupply = response.totalSupply
        self.maxSupply = response.maxSupply
        self.ath = response.ath
        self.athChangePercentage = response.athChangePercentage
        self.athDate = response.athDate
        self.atl = response.atl
        self.atlChangePercentage = response.atlChangePercentage
        self.atlDate = response.atlDate
        self.lastUpdated = response.lastUpdated
        self.sparklineIn7D = response.sparklineIn7D
        self.priceChangePercentage24HInCurrency = response.priceChangePercentage24HInCurrency
        self.currentHoldings = nil
    }
}
