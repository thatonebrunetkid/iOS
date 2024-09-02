//
//  ContentView.swift
//  zen
//
//  Created by Mateusz Augustyniak on 02/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("onboarding") var isOnboardingDone: Bool = false
    
    var body: some View {
        ZStack {
            if isOnboardingDone
            {
                HomeView()
            }else
            {
                OnboardingView()
            }
        }
    }
}

#Preview {
    ContentView()
}
