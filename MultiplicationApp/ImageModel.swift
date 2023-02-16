//
//  ImageModel.swift
//  MultiplicationApp
//
//  Created by Nick Pavlov on 2/15/23.
//

import Foundation
import SwiftUI

struct AnswerImage: View {
    var image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 60, height: 60)
    }
}

