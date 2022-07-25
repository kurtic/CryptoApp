//
//  HomeView.swift
//  CryptoAppChecker
//
//  Created by Diachenko Ihor on 23.07.2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeVM
    @State private var showPortfolio: Bool = false
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                header
                titlesRow
                
                if !showPortfolio {
                    coinsList
                        .transition(.move(edge: .leading))
                } else {
                    portfolioCoinsList.transition(.move(edge: .trailing))
                }
                
                Spacer(minLength: 0)
            }
        }
    }
}

extension HomeView {
    private var header: some View {
        HStack {
            if showPortfolio {
                CircleButtonView(iconName: "plus")
                    .background ( CircleButtonAnimationView(animate: $showPortfolio))
            } else {
                CircleButtonView(iconName: "plus").hidden()
            }
                                
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .animation(.none)
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var coinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(EdgeInsets(top: 10,
                                              leading: 0,
                                              bottom: 10,
                                              trailing: 0))
            }
        }
        .listStyle(.plain)
    }
    
    private var portfolioCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(EdgeInsets(top: 10,
                                              leading: 0,
                                              bottom: 10,
                                              trailing: 0))
            }
        }
        .listStyle(.plain)
    }
    
    private var titlesRow: some View {
        HStack {
            Text("Coin")
            Spacer()
            if showPortfolio {
                Text("Holdings")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.6, alignment: .trailing )
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .toolbar(.hidden)
        }
        .environmentObject(HomeVM())
    }
}
