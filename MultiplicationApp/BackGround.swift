//
//  BackGround.swift
//  MultiplicationApp
//
//  Created by Nick Pavlov on 2/15/23.
//

import Foundation
import SwiftUI

struct BackGround: View {
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.red, .blue, .green, .yellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
            .opacity(0.5)
    }
}
