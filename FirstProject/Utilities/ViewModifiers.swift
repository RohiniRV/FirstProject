//
//  ViewModifiers.swift
//  FirstProject
//
//  Created by rvaidya on 17/11/21.
//

import SwiftUI

struct CustomTextField: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(LinearGradient(colors: [.indigo.opacity(0.6), .gray], startPoint: .leading, endPoint: .trailing))
            .cornerRadius(12)
            .frame(width: 250, height: 50, alignment: .center)

            .shadow(radius: 16)

    }
}

