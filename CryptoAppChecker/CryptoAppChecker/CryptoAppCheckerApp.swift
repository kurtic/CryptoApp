//
//  CryptoAppCheckerApp.swift
//  CryptoAppChecker
//
//  Created by Diachenko Ihor on 22.07.2022.
//

import SwiftUI

@main
struct CryptoAppCheckerApp: App {
    let persistenceController = PersistenceController.shared
    
    @StateObject private var vm = HomeVM()

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
