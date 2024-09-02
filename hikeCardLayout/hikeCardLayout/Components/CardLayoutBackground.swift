//
//  CardLayoutBackground.swift
//  hikeCardLayout
//
//  Created by Mateusz Augustyniak on 01/09/2024.
//

import SwiftUI

struct CardLayoutBackground: View {
    var body: some View {
        ZStack{
            
            //MARK: - DEPTH
            Color.colorGreenDark
                .cornerRadius(40)
                .offset(y: 12)
            
            //MARK: - LIGHT
            Color.colorGreenLight
                .cornerRadius(40)
                .offset(y: 3)
                .opacity(0.85)
            
            
            //MARK: - FRONT
            LinearGradient(colors: [.colorGreenLight, .colorGreenMedium], startPoint: .topLeading, endPoint: .bottomTrailing)
                .cornerRadius(40)
        }
    }
}

#Preview {
    CardLayoutBackground()
}
