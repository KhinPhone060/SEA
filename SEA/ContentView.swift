//
//  ContentView.swift
//  SEA
//
//  Created by Khin Phone Ei on 14/11/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeScreenView()
                .tag(0)
                .tabItem {
                    Image(.globe)
                    Text("Home")
                }
            MoreScreenView()
                .tag(1)
                .tabItem {
                    Image(.dots)
                        .renderingMode(.template)
                    Text("More")
                }
        }
    }
}

#Preview {
    ContentView()
}
