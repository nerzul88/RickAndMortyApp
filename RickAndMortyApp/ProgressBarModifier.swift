//
//  ProgressBarModifier.swift
//  RickAndMortyApp
//
//  Created by Александр Касьянов on 17.01.2023.
//

import Foundation
import SwiftUI

struct ProgressBarModifier: ViewModifier {
    let withLoading: Bool
    
    func body(content: Content) -> some View {
        if withLoading {
            VStack {
                content
                Divider()
                HStack {
                    Spacer()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                    Spacer()
                }
            }
        } else {
            content
        }
    }
}
