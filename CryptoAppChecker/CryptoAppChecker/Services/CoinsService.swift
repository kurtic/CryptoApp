//
//  CoinsService.swift
//  CryptoAppChecker
//
//  Created by Diachenko Ihor on 24.07.2022.
//

import Combine
import Foundation

final class CoinsService {
    
    @Published var allCoins: [Coin] = []
    
    var coinSubscription: AnyCancellable?
    
    init() {
        fetchCoins()
    }
    
    private func fetchCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else { return }
        coinSubscription = NetworkManager.download(url: url)
            .decode(type: [Coin.Response].self, decoder: JSONDecoder())
            .map { $0.map { Coin(from: $0)} }
            .sink (receiveCompletion: NetworkManager.handleComletion, receiveValue: { [weak self] coins in
                self?.allCoins = coins
                self?.coinSubscription?.cancel()
            })
    }
}
    
