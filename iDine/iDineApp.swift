//
//  iDineApp.swift
//  iDine
//
//  Created by Elliot Knight on 25/01/2022.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
