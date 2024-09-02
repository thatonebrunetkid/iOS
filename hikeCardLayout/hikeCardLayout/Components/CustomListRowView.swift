//
//  CustomListRowView.swift
//  hikeCardLayout
//
//  Created by Mateusz Augustyniak on 01/09/2024.
//

import SwiftUI

struct CustomListRowView: View {
    
    @State var rowLabel: String
    @State var rowIncon: String
    @State var rowContent: String
    @State var rowTintColor: Color
    
    var body: some View {
        LabeledContent{
            Text(rowContent)
                .foregroundColor(.primary)
                .fontWeight(.heavy)
        }label:{
            HStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIncon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    List() {
        CustomListRowView(rowLabel: "Designer", rowIncon: "paintpalette", rowContent: "John Doe", rowTintColor: .pink)
    }
}
