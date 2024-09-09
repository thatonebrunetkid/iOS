//
//  ContentView.swift
//  Pinch
//
//  Created by Mateusz Augustyniak on 09/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: PROPERTY
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = CGSize(width: 0, height: 0)
    @State private var isDrawerOpen: Bool = false
    
    let pages: [Page] = pagesData
    @State private var pageIndex: Int = 0
    
    //MARK: FUNCTIONS
    func resetImageState() {
        return withAnimation(.spring())
        {
            imageScale = 1;
            imageOffset = .zero
        }
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.clear
                // MARK: - PAGE IMAGE
                Image(pages[pageIndex].imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(.linear(duration: 1), value: isAnimating)
                    .scaleEffect(imageScale)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .onTapGesture(count: 2, perform: {
                        if imageScale == 1
                        {
                            withAnimation(.spring())
                            {
                                imageScale = 5
                            }
                        } else
                        {
                            resetImageState()
                        }
                    })
                    .gesture(DragGesture()
                        .onChanged{
                            value in
                            withAnimation(.linear(duration: 1)){
                                imageOffset = value.translation
                            }
                        }
                        .onEnded{
                            _ in
                            if imageScale <= 1 {
                                resetImageState()
                            }
                        }
                    ) //MARK: MAGNIFICATION
                    .gesture(MagnificationGesture()
                        .onChanged{
                            value in
                            withAnimation(.linear(duration: 1)){
                                if imageScale >= 1 && imageScale <= 5
                                {
                                    imageScale = value
                                }else if imageScale > 5 {
                                    imageScale = 5
                                }
                            }
                        }
                        .onEnded{_ in
                            if imageScale > 5 {
                                imageScale = 5
                            }else if imageScale <= 1 {
                                resetImageState()
                            }
                        }
                    )
                    
            }//: Zstack1
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                isAnimating = true
            })
            //MARK: INFOPANEL
            .overlay(
            InfoPanelView(scale: imageScale, offset: imageOffset)
                .padding(.horizontal)
                .padding(.top, 30)
            , alignment: .top
            )
            //MARK: CONTROLS
            .overlay(
                Group{
                    HStack{
                        //SCALE DOWN
                        Button{
                            withAnimation(.spring()){
                                if imageScale > 1 {
                                    imageScale -= 1
                                    
                                    if imageScale <= 1 {
                                        resetImageState()
                                    }
                                }
                            }
                        }label: {
                            ControlImageView(icon: "minus.magnifyingglass")
                        }
                        //SCALE UP
                        Button{
                            resetImageState()
                        }label: {
                            ControlImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
                        }
                        
                        
                        //RESET
                        
                        Button{
                            withAnimation(.spring())
                            {
                                if imageScale < 5 {
                                    imageScale += 1
                                }
                                
                                if imageScale > 5 {
                                    imageScale = 5
                                }
                            }
                        }label: {
                            ControlImageView(icon: "plus.magnifyingglass")
                        }
                    }.padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                        .background(.ultraThinMaterial)
                        .cornerRadius(12)
                        .opacity(isAnimating ? 1 : 0)
                }
                    .padding(.bottom, 30)
                , alignment: .bottom
            )
            //MARK: - DRAWER
            .overlay(
                HStack(spacing: 12){
                    //DRAWER HANDLE
                    Image(systemName: isDrawerOpen ? "chevron.compact.right" :  "chevron.compact.left")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .padding(8)
                        .foregroundStyle(.secondary)
                        .onTapGesture(perform: {
                            withAnimation(.easeOut)
                            {
                                isDrawerOpen.toggle()
                            }
                        })
                    
                    //THUMBNAILS
                    ForEach(pages) { item in
                        Image(item.imageName)
                            .resizable()
                            .scaledToFit()
                            .onTapGesture(perform: {
                                pageIndex = item.id - 1
                            })
                    }
                    
                    Spacer()
                }
                    .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimating ? 1 : 0)
                    .frame(width: 260)
                    .padding(.top, UIScreen.main.bounds.height / 12)
                    .offset(x: isDrawerOpen ? 20 : 215)
                , alignment: .topTrailing
            )
        }
        .navigationViewStyle(.stack)
    }
}

#Preview {
    ContentView()
}
