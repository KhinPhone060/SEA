//
//  InhibitantDetailScreen.swift
//  SEA
//
//  Created by Khin Phone Ei on 14/11/2024.
//

import SwiftUI

struct InhabitantDetailScreen: View {
    @Environment(\.presentationMode) var presentationMode
    
    let image: String
    let name: String
    let description: String
    
    var body: some View {
        VStack(spacing: 0) {
            TopNavBar()
            
            ScrollView(showsIndicators: false) {
                Image(image)
                    .resizable()
                    .scaledToFit()
                
                DetailSection()
            }
        }
    }
    
    func TopNavBar() -> some View {
        HStack(spacing: 20) {
            Group {
                Image(systemName: "chevron.left")
                Text(name)
                    .font(.title3)
            }
            .onTapGesture {
                presentationMode.wrappedValue.dismiss()
            }
            
            Spacer()
        }
        .padding()
        .background(.white)
        .shadow(color: .black.opacity(0.2), radius: 7, x: 0, y: 3)
    }
    
    func DetailSection() -> some View {
        VStack(alignment: .leading) {
            Text("ZONE 1")
                .font(.caption)
                .foregroundColor(.gray)
            
            Text(name)
                .font(.title)
                .fontWeight(.bold)
            
            HStack {
                Image(.walking)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 20)
                
                Text("410m away")
                Text("Map")
                    .foregroundColor(.red)
            }
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.horizontal, 6)
            .padding(.vertical, 3)
            .background(.white)
            .overlay {
                RoundedRectangle(cornerRadius: 6)
                    .stroke(.gray)
            }
            
            Text(description)
                .font(.footnote)
        }
        .padding()
    }
}

#Preview {
    InhabitantDetailScreen(image: "animal", name: "Blue Tang", description: "Blue Tangs are surgeonfish that have a royal blue body with a black palette shape and a yellow tail. Learn more at the S.E.A. Aquarium.")
}
