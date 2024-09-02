//
//  CircleComponent.swift
//  zen
//
//  Created by Mateusz Augustyniak on 02/09/2024.
//

import SwiftUI

struct CircleComponent: View {
    
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    
    @State private var animationBegin: Bool = false
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260)
            
        }
        .blur(radius: animationBegin ? 1 : 10)
        .scaleEffect(animationBegin ? 1 : 0.2)
        .opacity(animationBegin ? 1 : 0)
        .animation(.easeOut(duration: 1), value: animationBegin)
        .onAppear(perform: {
            animationBegin = true
        })
    }
}

#Preview {
    ZStack{
        Color("ColorBlue").ignoresSafeArea()
        CircleComponent(ShapeColor: .white, ShapeOpacity: 0.2)
    }
}
