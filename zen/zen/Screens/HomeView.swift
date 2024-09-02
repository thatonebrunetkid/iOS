//
//  HomeView.swift
//  zen
//
//  Created by Mateusz Augustyniak on 02/09/2024.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("onboarding") var isOnboardingDone: Bool = true
    @State private var animationBegined: Bool = false
    
    var body: some View {
        ZStack{
            Spacer()
            VStack{
                ZStack{
                    CircleComponent(ShapeColor: .gray, ShapeOpacity: 0.2)
                    ZStack{
                        Image("character-2")
                            .resizable()
                            .scaledToFit()
                    }
                    .scaleEffect(animationBegined ? 1 : 0.2)
                    .blur(radius: animationBegined ? 0 : 5)
                    .animation(.easeOut(duration: 1), value: animationBegined)
                    .padding()
                }
                
                Text("The time that leads to mastery is dependent on the intensity of out focus")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
                    .fontWeight(.light)
                
                Button(action: {
                    isOnboardingDone = false
                }, label: {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    Text("Restart")
                })
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
            }
        }.onAppear(perform: {
            animationBegined = true
        })
    }
}

#Preview {
    HomeView()
}
