//
//  MyLocalPApp.swift
//  MyLocalP
//
//  Created by Dmitriy Khanin on 22.10.23..
//

import SwiftUI

@main
struct MyLocalPApp: App {
    var body: some Scene {
        MenuBarExtra("Current IP Address", systemImage: "globe") {
            MainView()
        }.menuBarExtraStyle(.window)
        WindowGroup {}
    }
}
