//
//  CoinImageService.swift
//  CryptoAppChecker
//
//  Created by Diachenko Ihor on 25.07.2022.
//

import SwiftUI
import Combine

final class CoinImageService {
    
    @Published var image: UIImage?
    
    private var imageSubscription: AnyCancellable?
    private let coin: Coin
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    
    init(coin: Coin) {
        self.coin = coin
        getCoinImage()
        
    }
    
    private func getCoinImage() {
        if let savedImage = fileManager.getImage(imageName: coin.id, folderName: folderName) {
            image = savedImage
            print("Retrieved image from File Manager")
        } else {
            fetchCoinImage()
        }
    }
    
    private func fetchCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        imageSubscription = NetworkManager.download(url: url)
            .tryMap { UIImage(data: $0) }
            .sink (receiveCompletion: NetworkManager.handleComletion, receiveValue: { [weak self] image in
                self?.image = image
                self?.imageSubscription?.cancel()
            })
    }
}
