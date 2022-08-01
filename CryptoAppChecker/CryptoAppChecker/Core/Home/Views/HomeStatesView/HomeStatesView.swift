//
//  HomeStatesView.swift
//  CryptoAppChecker
//
//  Created by Diachenko Ihor on 28.07.2022.
//

import SwiftUI

struct HomeStatesView: View {
    
    @EnvironmentObject private var vm: HomeVM
    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack {
            ForEach(vm.stats) { statistic in
                StatisticView(stat: statistic)
                    .frame(width: UIScreen.main.bounds.width / 3.2)
            }
        }
        .frame(width: UIScreen.main.bounds.width,
               alignment: showPortfolio ? .trailing : .leading)
    }
}

struct HomeStatesView_Previews: PreviewProvider {
    static var previews: some View {
        HomeStatesView(showPortfolio: .constant(true))
            .environmentObject(HomeVM())
    }
}
