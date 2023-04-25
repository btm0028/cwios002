//
//  CapyWrite_ChatApp.swift
//  CapyWrite Chat
//
//  Created by Brandon Miller on 4/1/23.
//

import SwiftUI

@main
struct CapyWrite_ChatApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
