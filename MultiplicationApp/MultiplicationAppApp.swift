//
//  MultiplicationAppApp.swift
//  MultiplicationApp
//
//  Created by Nick Pavlov on 2/14/23.
//

import SwiftUI

@main
struct MultiplicationAppApp: App {
    var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
