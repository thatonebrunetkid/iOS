//
//  Settings.swift
//  hikeCardLayout
//
//  Created by Mateusz Augustyniak on 01/09/2024.
//

import SwiftUI

struct Settings: View {
    
    private let alternativeAppIcons: [String] = [
    "AppIcon-Backpack",
    "AppIcon-Boy",
    "AppIcon-Camera",
    "AppIcon-Firebone",
    "AppIcon-Girl",
    "AppIcon-Mushroom"
    ]
    
    var body: some View {
        List{
            Section {
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66))
                            .fontWeight(.black)
                        
                        Text("Editors' Choise")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    
                    Spacer()
                }
                .foregroundStyle(LinearGradient(colors: [.customGrayLight, .customGrayMedium, .customGreenDark], startPoint: .top, endPoint: .bottom))
                .padding(.top, 8)
                
                VStack(spacing: 8){
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike whick looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            }
            .listRowSeparator(.hidden)
            
            Section(
                header: Text("Alternate icons")
            ){
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 12) {
                        ForEach(alternativeAppIcons.indices, id: \.self) { item in
                            Button{
                                
                            }label:{
                                Image("\(alternativeAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                        }
                        }
                    }
                }
                
                Text("Choose your fav icon")
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
            }.listRowSeparator(.hidden)
            
            
            Section(
                header: Text("About application"),
                footer: HStack{
                    Spacer()
                    Text("Copyright © All rights reserved.")
                    Spacer()
                }.padding(.vertical, 8)
            ){
                CustomListRowView(rowLabel: "Application", rowIncon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)
                CustomListRowView(rowLabel: "Compability", rowIncon: "info.circle", rowContent: "iOS, iPadOS", rowTintColor: .red)
            }
        }
        
    }
}

#Preview {
    Settings()
}
