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
    
    var formattedWithAbbreviations: String {
        let num = abs(Double(self))
        let sign = (self < 0) ? "-" : ""

        switch num {
        case 1_000_000_000_000...:
            let formatted = num / 1_000_000_000_000
            let stringFormatted = formatted.formattedNumberString
            return "\(sign)\(stringFormatted)Tr"
        case 1_000_000_000...:
            let formatted = num / 1_000_000_000
            let stringFormatted = formatted.formattedNumberString
            return "\(sign)\(stringFormatted)Bn"
        case 1_000_000...:
            let formatted = num / 1_000_000
            let stringFormatted = formatted.formattedNumberString
            return "\(sign)\(stringFormatted)M"
        case 1_000...:
            let formatted = num / 1_000
            let stringFormatted = formatted.formattedNumberString
            return "\(sign)\(stringFormatted)K"
        case 0...:
            return self.formattedNumberString
        default:
            return "\(sign)\(self)"
        }
    }
}
