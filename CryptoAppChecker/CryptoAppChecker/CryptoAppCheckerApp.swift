//
//  CryptoAppCheckerApp.swift
//  CryptoAppChecker
//
//  Created by Diachenko Ihor on 22.07.2022.
//

import SwiftUI

@main
struct CryptoAppCheckerApp: App {
    
    @StateObject private var vm = HomeVM()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
