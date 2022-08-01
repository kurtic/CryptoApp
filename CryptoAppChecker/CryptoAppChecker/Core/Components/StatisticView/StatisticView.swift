//
//  StatisticView.swift
//  CryptoAppChecker
//
//  Created by Diachenko Ihor on 28.07.2022.
//

import SwiftUI

struct StatisticView: View {
    
    let stat: Statistic
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
            
            Text(stat.value)
                .font(.headline)
                .foregroundColor(Color.theme.accent)
            HStack(spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(Angle(degrees: ((stat.percentageChange ?? 0) >= 0) ? 0 : 180))
                Text(stat.percentageChange?.percentRepresentationString ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundColor(((stat.percentageChange ?? 0) >= 0) ? Color.theme.green : Color.theme.red)
            .opacity(stat.percentageChange == nil ? 0 : 1)
        }
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StatisticView(stat: .mock1)
                .previewLayout(.sizeThatFits)
            StatisticView(stat: .mock2)
                .previewLayout(.sizeThatFits)
            StatisticView(stat: .mock3)
                .previewLayout(.sizeThatFits)
        }
    }
}
