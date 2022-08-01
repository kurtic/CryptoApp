//
//  CoinRowView.swift
//  CryptoAppChecker
//
//  Created by Diachenko Ihor on 23.07.2022.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: Coin
    let showHoldingsColumn: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            Spacer()
            if showHoldingsColumn {
                middleColumn
            }
            rightColumn
        }
        .font(.subheadline)
    }
}

extension CoinRowView {
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.marketCapRank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30)
            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.accent)
        }
    }
    
    private var middleColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWithDecimals)
                .bold()
            Text((coin.currentHoldings ?? 0).percentRepresentationString)
        }
        .foregroundColor(Color.theme.accent)
    }
    
    private var rightColumn: some View {
        VStack {
            Text("\(coin.currentPrice.asCurrencyWithDecimals)")
                 .bold()
                .foregroundColor(Color.theme.accent)
            Text(coin.priceChangePercentage24H?.percentRepresentationString ?? "")
                .foregroundColor (
                    (coin.priceChangePercentage24H ?? 0) >= 0 ?
                    Color.theme.green :
                    Color.theme.red
                )
        }
        .padding(.trailing, 0)
        .frame(width: UIScreen.main.bounds.width / 3)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: .mock, showHoldingsColumn: true)
    }
}
