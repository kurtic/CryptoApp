//
//  HomeVM.swift
//  CryptoAppChecker
//
//  Created by Diachenko Ihor on 24.07.2022.
//

import SwiftUI
import Combine

final class HomeVM: ObservableObject {
    
    @Published var stats = [
        Statistic(title: "Title", value: "Value", percentageChange: 1),
        Statistic(title: "Title", value: "Value"),
        Statistic(title: "Title", value: "Value"),
        Statistic(title: "Title", value: "Value", percentageChange: -7)
    ]
    
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    @Published var searchText: String = ""
    
    private let coinsService = CoinsService()
    private let marketDataService = MarketDataService()
    private let portfolioDataService = PortfolioDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
       addSubscribers()
    }
    
    func addSubscribers() {
        $searchText
            .combineLatest(coinsService.$allCoins)
            .debounce(for: .seconds(0.75) , scheduler: DispatchQueue.main)
            .map(filterCoins)
            .sink { [weak self] filteredCoins in
                self?.allCoins = filteredCoins
            }
            .store(in: &cancellables)
        
        marketDataService.$marketData
            .map { marketDataModel in
                guard let data = marketDataModel else { return [] }
                
                let marcketCap = Statistic(title: "Marcket Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
                let volume = Statistic(title: "24h Volume", value: data.volume)
                let btcDominance = Statistic(title: "BTC Dominance", value: data.btcDominance)
                let portfolio = Statistic(title: "Portfolio Value", value: "$0.00", percentageChange: 0)
                
                return [marcketCap, volume, btcDominance, portfolio]
            }
            .sink { [weak self] statistics in
                self?.stats = statistics
            }
            .store(in: &cancellables)
        
        $allCoins
            .combineLatest(portfolioDataService.$savedEntities)
            .map { (coinModels, portfolioEntities) -> [Coin] in
                coinModels
                    .compactMap { coin -> Coin? in
                        guard let entity = portfolioEntities.first(where: { $0.coinId == coin.id }) else { return nil }
                        return coin.updateCurrentHoldings(amount: entity.amount)
                    }
            }
            .sink { [weak self] coins in
                self?.portfolioCoins = coins
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text: String, coins: [Coin]) -> [Coin] {
        guard !text.isEmpty else { return coins }
        return coins.filter {
            $0.name.lowercased().contains(text.lowercased()) || $0.symbol.lowercased().contains(text.lowercased())
        }
    }
    
    func updatePortfolio(coin: Coin, amount: Double) {
        portfolioDataService.updatePortfolio(coin: coin, amount: amount)
    }
}
