//
//  Coin.swift
//  CryptoAppChecker
//
//  Created by Diachenko Ihor on 23.07.2022.
//

import Foundation

/*
 
 Request URL
 https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h
 
 [
   {
     "id": "bitcoin",
     "symbol": "btc",
     "name": "Bitcoin",
     "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
     "current_price": 22457,
     "market_cap": 429158794810,
     "market_cap_rank": 1,
     "fully_diluted_valuation": 471827133556,
     "total_volume": 37233097499,
     "high_24h": 23668,
     "low_24h": 22445,
     "price_change_24h": -1077.4002592368233,
     "price_change_percentage_24h": -4.5779,
     "market_cap_change_24h": -19965818321.07953,
     "market_cap_change_percentage_24h": -4.4455,
     "circulating_supply": 19100925,
     "total_supply": 21000000,
     "max_supply": 21000000,
     "ath": 69045,
     "ath_change_percentage": -67.45885,
     "ath_date": "2021-11-10T14:24:11.849Z",
     "atl": 67.81,
     "atl_change_percentage": 33034.18387,
     "atl_date": "2013-07-06T00:00:00.000Z",
     "roi": null,
     "last_updated": "2022-07-23T11:42:43.933Z",
     "sparkline_in_7d": {
       "price": [
         20697.411831421952,
         20536.978833174362,
         20522.749339726004
       ]
     },
     "price_change_percentage_24h_in_currency": -4.577903376882862
   }
 ]
 */

struct Coin: Identifiable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCapRank: Int
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
    var currentHoldings: Double?
}

extension Coin {
    func updateCurrentHoldings(amount: Double) -> Coin {
        Coin(id: id,
             symbol: symbol,
             name: name,
             image: image,
             currentPrice: currentPrice,
             marketCapRank: marketCapRank,
             marketCap: marketCap,
             fullyDilutedValuation: fullyDilutedValuation,
             totalVolume: totalVolume,
             high24H: high24H,
             low24H: low24H,
             priceChange24H: priceChange24H,
             priceChangePercentage24H: priceChangePercentage24H,
             marketCapChange24H: marketCapChange24H,
             marketCapChangePercentage24H: marketCapChangePercentage24H,
             circulatingSupply: circulatingSupply,
             totalSupply: totalSupply,
             maxSupply: maxSupply,
             ath: ath,
             athChangePercentage: athChangePercentage,
             athDate: athDate,
             atl: atl,
             atlChangePercentage: atlChangePercentage,
             atlDate: atlDate,
             lastUpdated: lastUpdated,
             sparklineIn7D: sparklineIn7D,
             priceChangePercentage24HInCurrency: priceChangePercentage24HInCurrency,
             currentHoldings: amount)
    }
    
    var currentHoldingsValue: Double {
        (currentHoldings ?? 0) * currentPrice
    }
}
