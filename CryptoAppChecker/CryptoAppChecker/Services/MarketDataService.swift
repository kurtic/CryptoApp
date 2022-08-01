//
//  MarketDataService.swift
//  CryptoAppChecker
//
//  Created by Diachenko Ihor on 28.07.2022.
//

import Combine
import Foundation

final class MarketDataService {
    
    @Published var marketData: MarcketDataModel?
    
    var marketDataSubscription: AnyCancellable?
    
    init() {
        fetchMarketData()
    }
    
    private func fetchMarketData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else { return }
        marketDataSubscription = NetworkManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink (receiveCompletion: NetworkManager.handleComletion, receiveValue: { [weak self] globalData in
                self?.marketData = globalData.data
                self?.marketDataSubscription?.cancel()
            })
    }
}
