//
//  BackgroundCircleView.swift
//  hikeCardLayout
//
//  Created by Mateusz Augustyniak on 01/09/2024.
//

import SwiftUI

struct BackgroundCircleView: View {
    
    @State private var isAnimatedGradient: Bool = false
    
    var body: some View {
        ZStack{
            Circle()
                .fill(
                    LinearGradient(colors: [.customIndigoMedium, .colorSalmonLight],
                                   startPoint: isAnimatedGradient ? .topLeading : .bottomLeading,
                                   endPoint: isAnimatedGradient ? .topTrailing : .bottomTrailing
                                  )
                ).onAppear() {
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                        isAnimatedGradient.toggle()
                    }
                }
            
            MotionAnimationView()
        }.frame(width: 256, height: 256)
    }
}

#Preview {
    BackgroundCircleView()
}
