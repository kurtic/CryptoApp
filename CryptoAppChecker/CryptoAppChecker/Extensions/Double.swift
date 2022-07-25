//
//  Double.swift
//  CryptoAppChecker
//
//  Created by Diachenko Ihor on 23.07.2022.
//

import Foundation

extension Double {
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencyCode = "usd"
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    var asCurrencyWithDecimals: String {
        currencyFormatter2.string(from: NSNumber(value: self)) ?? "$0.00"
    }
    
    var formattedNumberString: String {
        String(format: "%.2f", self)
    }
    
    var percentRepresentationString: String {
        formattedNumberString + "%"
    }
}
