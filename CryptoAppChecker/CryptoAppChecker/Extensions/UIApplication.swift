//
//  UIApplication.swift
//  CryptoAppChecker
//
//  Created by Diachenko Ihor on 27.07.2022.
//

import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
