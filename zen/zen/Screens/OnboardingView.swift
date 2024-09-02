//
//  OnboardingView.swift
//  zen
//
//  Created by Mateusz Augustyniak on 02/09/2024.
//

import SwiftUI

struct OnboardingView: View {
    
    @AppStorage("onboarding") var onboardingDone: Bool = false
    @State private var animationBegin: Bool = false
    @State private var buttonOffset: CGFloat = 0
    @State private var indicatorOpacity: Double = 1.0
    @State private var textValue: String = "Share."
    @State private var imageOffset: CGSize = .zero
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    
    
    var body: some View {
        ZStack{
            Color("ColorBlue")
                .ignoresSafeArea()
            //MARK: - UPPER TEXT
            VStack{
                Spacer()
                VStack {
                    Text("Share.")
                        .font(.system(size: 52))
                        .fontWeight(.heavy)
                    .foregroundColor(.white)
                    
                    Text("It's not how much we give but how much love we put into giving")
                        .multilineTextAlignment(.center)
                        .font(.title2)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                }// Vstack 2
                .offset(y: animationBegin ? 0 : -100)
                .scaleEffect(animationBegin ? 1 : 0.2)
                .blur(radius: animationBegin ? 0 : 50)
                .animation(.easeOut(duration: 1), value: animationBegin)
                
                ZStack{
                    
                    CircleComponent(ShapeColor: .white, ShapeOpacity: 0.2)
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width / 5))
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .offset(x: imageOffset.width)
                        .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                        .gesture(
                            DragGesture()
                                .onChanged{gesture in
                                    if abs(imageOffset.width) <= 150
                                    {
                                        imageOffset = gesture.translation
                                    }
                                }
                                .onEnded{ _ in
                                    imageOffset = .zero
                                }
                        )
                }//ZSTACK 2
                .animation(.easeOut(duration: 1), value: imageOffset)
                .scaleEffect(animationBegin ? 1 : 0.1)
                .blur(radius: animationBegin ? 0 : 50)
                .animation(.easeOut(duration: 1), value: animationBegin)
                
                ZStack{
                    
                    ZStack{
                        Capsule()
                            .fill(.white.opacity(0.2))
                        Capsule()
                            .fill(.white.opacity(0.2))
                            .padding(8)
                        
                        Text("Get started")
                            .font(.system(.title3, design: .rounded))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.white)
                            .offset(x: 20)
                        
                        HStack{
                            Capsule()
                                .fill(Color("ColorRed"))
                                .frame(width: buttonOffset + 80)
                            Spacer()
                        }
                        
                        HStack{
                            ZStack{
                                Circle()
                                    .fill(Color("ColorRed"))
                                Circle()
                                    .fill(.black.opacity(0.25))
                                    .padding(8)
                                Image(systemName: "chevron.right.2")
                                    .font(.system(size: 24, weight: .bold))
                            }
                            .foregroundColor(.white)
                            .frame(width: 80, height: 80, alignment: .center)
                            .offset(x: buttonOffset)
                            .gesture(
                                DragGesture()
                                    .onChanged{gesture in
                                    
                                        if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80
                                        {
                                            buttonOffset = gesture.translation.width
                                        }
                                    }
                                    .onEnded{
                                        _ in
                                        if buttonOffset > buttonWidth / 2
                                        {
                                            buttonOffset = buttonWidth - 80
                                            onboardingDone = true
                                        }else
                                        {
                                            buttonOffset = 0
                                        }
                                    }
                            )
                            

                            Spacer()
                        }
                        
                    }
                    .frame(width: buttonWidth, height: 80, alignment: .center)
                    
                    
                }//ZSTACK3
                .offset(y: animationBegin ? 0 : 10)
                .blur(radius: animationBegin ? 0 : 50)
                .scaleEffect(animationBegin ? 1 : 0.2)
                .animation(.easeOut(duration: 1), value: animationBegin)
            }//VSTACK 1
            
        }//ZSTACK 1
        .onAppear(perform: {
            animationBegin = true
        })
    }
}

#Preview {
    OnboardingView()
}
