//
//  Statistic.swift
//  CryptoAppChecker
//
//  Created by Diachenko Ihor on 27.07.2022.
//

import Foundation

struct Statistic: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
}

extension Statistic {
    static let mock1 = Statistic(title: "Market Cap", value: "$12.01Bn", percentageChange: 25.34)
    static let mock2 = Statistic(title: "Total Volume", value: "$1.23Tr")
    static let mock3 = Statistic(title: "Portfolio Value", value: "$50.4k", percentageChange: -12.34)
}
