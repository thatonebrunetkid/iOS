//
//  CardView.swift
//  hikeCardLayout
//
//  Created by Mateusz Augustyniak on 01/09/2024.
//

import SwiftUI

struct CardView: View {
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    func randomImage() {
        repeat{
            randomNumber = Int.random(in: 1...5)
        }while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
    
    var body: some View {
        //MARK: - Zstack1 start
       ZStack
        {
            //MARK: - BACKGROUND
            CardLayoutBackground()
            VStack {
                VStack(alignment: .leading)
                {
                    HStack{
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
                            )
                        Spacer()
                        Button{
                            isShowingSheet.toggle()
                        }label:{
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet)
                        {
                            Settings()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                    }//hstack
                    Text("Fun and enjoyable outdoor activity for friends and fimilies")
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .italic()
                        .foregroundColor(.customGrayMedium)
            }.padding(.horizontal, 30)
                ZStack{
                    BackgroundCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                
                Button{
                    randomImage()
                }label:{
                    Text("Explore more")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(LinearGradient(colors: [.customGreenLight, .customGrayMedium], startPoint: .top, endPoint: .bottom))
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }.buttonStyle(GradientButton())
            }//vstack
        }.frame(width: 320, height: 570)
        
        //: Zstack1
    }
}

#Preview {
    CardView()
}
