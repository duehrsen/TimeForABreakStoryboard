//
//  StandardButton.swift
//  TimeForABreakStoryboard
//
//  Created by Chris Duehrsen on 2022-03-17.
//

import SwiftUI


class StandardButton : ButtonStyle {
    
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(configuration.isPressed ? .blue : .cyan)
            .padding()
            .background(Color.accentColor)
            .cornerRadius(10)
    }
    
    
}
