//
//  InhabitantsScreenView.swift
//  SEA
//
//  Created by Khin Phone Ei on 14/11/2024.
//

import SwiftUI

struct InhabitantsScreenView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let inhabitants = [
        InhabitantInfo(image: "animal", name: "Blue Tang", description: "Blue Tangs are surgeonfish that have a royal blue body with a black palette shape and a yellow tail. Learn more at the S.E.A. Aquarium."),
        InhabitantInfo(image: "animal2", name: "Blacktip Reef Shark", description: "Blacktip reef sharks are identified by their black-tipped fins and inhabit shallow waters near coral reefs. Learn more at the S.E.A. Aquarium."),
        InhabitantInfo(image: "animal3", name: "Clown Fish", description: "Clownfish are feisty fish that have a symbiotic relationship with sea anemones. Learn more at the S.E.A. Aquarium.")
    ]
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Group {
                    Image(systemName: "chevron.left")
                    Text("Inhabitants")
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
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 15) {
                    ForEach(inhabitants, id: \.self) { inhabitant in
                        AnimalInfo(image: inhabitant.image, name: inhabitant.name, description: inhabitant.description)
                    }
                }
                .padding()
            }
        }
    }
    
    func AnimalInfo(image: String, name: String, description: String) -> some View {
        HStack(alignment: .top, spacing: 0) {
            Image(image)
                .resizable()
                .scaledToFit()
                .cornerRadius(15)
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.subheadline)
                Text(description)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
            .padding()
        }
    }
}

#Preview {
    InhabitantsScreenView()
}
