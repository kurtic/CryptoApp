//
//  HomeVM.swift
//  CryptoAppChecker
//
//  Created by Diachenko Ihor on 24.07.2022.
//

import SwiftUI
import Combine

final class HomeVM: ObservableObject {
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    
    private let coinsService = CoinsService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
       addSubscribers()
    }
    
    func addSubscribers() {
        coinsService.$allCoins.sink { [weak self] coins in
            self?.allCoins = coins
        }
        .store(in: &cancellables)
    }
}
