//
//  MarketDataModel.swift
//  CryptoAppChecker
//
//  Created by Diachenko Ihor on 28.07.2022.
//

import Foundation

/*
 
 https://api.coingecko.com/api/v3/global
 
 Response:
 {
   "data": {
     "active_cryptocurrencies": 13105,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 532,
     "total_market_cap": {
       "btc": 47773335.78144648,
       "eth": 678068423.4523183,
       "ltc": 18372079325.809338,
       "bch": 7542648140.229001,
       "bnb": 4109370714.1242275,
       "eos": 855665067782.6196,
       "xrp": 3087810571687.502,
       "xlm": 9824125566282.355,
       "link": 160819707463.24203,
       "dot": 144521920586.4294,
       "yfi": 148523114.86690703,
       "usd": 1094489285013.2043,
       "aed": 4020064616299.9326,
       "ars": 143284657597489.75,
       "aud": 1563563313805.5962,
       "bdt": 103323954131465.22,
       "bhd": 412706736124.92487,
       "bmd": 1094489285013.2043,
       "brl": 5739830157394.754,
       "cad": 1401159710227.4814,
       "chf": 1047577285278.9679,
       "clp": 996258871683271,
       "cny": 7381673533843.043,
       "czk": 26389231150953.39,
       "dkk": 7985556902359.833,
       "eur": 1072764767194.9811,
       "gbp": 899082451534.8019,
       "hkd": 8591686162889.412,
       "huf": 437373354968152.75,
       "idr": 16325411905266718,
       "ils": 3738518192623.134,
       "inr": 87303029024895.47,
       "jpy": 148087574281213.16,
       "krw": 1425043671822376.2,
       "kwd": 335986320713.35394,
       "lkr": 392668670877424.44,
       "mmk": 2019516374112007.8,
       "mxn": 22298533668645.16,
       "myr": 4872119052236.27,
       "ngn": 464381273549692.06,
       "nok": 10615163724661.105,
       "nzd": 1740411986967.3167,
       "php": 61169362216482.02,
       "pkr": 257688692612104.34,
       "pln": 5136156930820.73,
       "rub": 65806172639376.28,
       "sar": 4110513210813.4224,
       "sek": 11198200355766.238,
       "sgd": 1511331001656.9124,
       "thb": 40034252051488.05,
       "try": 19624636148447.24,
       "twd": 32767693617174.785,
       "uah": 40264912384836.69,
       "vef": 109591212108.37233,
       "vnd": 25578157157433390,
       "zar": 18315458412221.54,
       "xdr": 804074214659.945,
       "xag": 56301021341.257706,
       "xau": 626748344.1699646,
       "bits": 47773335781446.48,
       "sats": 4777333578144648
     },
     "total_volume": {
       "btc": 6137560.276224224,
       "eth": 87113151.13899145,
       "ltc": 2360307113.1055436,
       "bch": 969022925.5664585,
       "bnb": 527941163.0511093,
       "eos": 109929437496.27992,
       "xrp": 396698769204.5273,
       "xlm": 1262130053050.856,
       "link": 20660911196.905098,
       "dot": 18567093637.605816,
       "yfi": 19081137.102890734,
       "usd": 140611783719.2968,
       "aed": 516467784659.8968,
       "ars": 18408139358028.215,
       "aud": 200874900762.14597,
       "bdt": 13274287551550.45,
       "bhd": 53021469569.521385,
       "bmd": 140611783719.2968,
       "brl": 737410377359.109,
       "cad": 180010502458.52545,
       "chf": 134584881445.52025,
       "clp": 127991876130490.14,
       "cny": 948342114116.4238,
       "czk": 3390290717255.968,
       "dkk": 1025924525171.7672,
       "eur": 137820780424.253,
       "gbp": 115507377689.40472,
       "hkd": 1103795471607.2952,
       "huf": 56190451962828.64,
       "idr": 2097366615995791,
       "ils": 480296809415.94464,
       "inr": 11216039118318.088,
       "jpy": 19025182111393.652,
       "krw": 183078934912024.4,
       "kwd": 43165005366.14979,
       "lkr": 50447129066315.19,
       "mmk": 259452334072681.44,
       "mxn": 2864748551133.75,
       "myr": 625933355226.4485,
       "ngn": 59660227006126.55,
       "nok": 1363756709394.341,
       "nzd": 223595093387.2939,
       "php": 7858581393172.368,
       "pkr": 33105912692461.336,
       "pln": 659854963766.2455,
       "rub": 8454284058569.885,
       "sar": 528087942466.4593,
       "sek": 1438660887805.1816,
       "sgd": 194164484607.7101,
       "thb": 5143300777731.906,
       "try": 2521226229859.405,
       "twd": 4209747789191.72,
       "uah": 5172934289315.393,
       "vef": 14079457903.813213,
       "vnd": 3286090006916620.5,
       "zar": 2353032882316.431,
       "xdr": 103301431191.86734,
       "xag": 7233133429.82333,
       "xau": 80519931.82901853,
       "bits": 6137560276224.224,
       "sats": 613756027622422.4
     },
     "market_cap_percentage": {
       "btc": 39.99240515128525,
       "eth": 17.73813769005241,
       "usdt": 6.016733477232102,
       "usdc": 4.9994352705735485,
       "bnb": 3.976237183583929,
       "busd": 1.6215420199402852,
       "xrp": 1.5654190175654736,
       "ada": 1.5471169176014825,
       "sol": 1.246934814714617,
       "doge": 0.8071270322524822
     },
     "market_cap_change_percentage_24h_usd": 6.400140210341526,
     "updated_at": 1659000392
   }
 }
 */

struct GlobalData: Codable {
    let data: MarcketDataModel?
}

// MARK: - DataClass
struct MarcketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]?
    let marketCapChangePercentage24HUsd: Double

    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        guard let item = totalMarketCap?.first(where: { $0.key == "usd"}) else { return "" }
        return "$" + item.value.formattedWithAbbreviations
    }
    
    var volume: String {
        guard let item = totalVolume?.first(where: { $0.key == "usd"}) else { return "" }
        return "$" + item.value.formattedWithAbbreviations
    }
    
    var btcDominance: String {
        guard let item = marketCapPercentage?.first(where: { $0.key == "btc"}) else { return "" }
        return "\(item.value.percentRepresentationString)"
    }
}
