//
//  CoinImageVM.swift
//  CryptoAppChecker
//
//  Created by Diachenko Ihor on 25.07.2022.
//

import SwiftUI
import Combine

final class CoinImageVM: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let coin: Coin
    private let dataService: CoinImageService
    private var cancellable = Set<AnyCancellable>()
    
    init(coin: Coin) {
        self.coin = coin
        dataService = CoinImageService(coin: coin)
        addSubscribers()
        isLoading = true
    }
    
    private func addSubscribers() {
        dataService.$image.sink { [weak self] _ in
            self?.isLoading = false
        } receiveValue: { [weak self] image in
            self?.image = image
        }
        .store(in: &cancellable)
    }
}
