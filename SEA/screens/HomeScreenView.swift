//
//  HomeScreenView.swift
//  SEA
//
//  Created by Khin Phone Ei on 14/11/2024.
//

import SwiftUI

struct HomeScreenView: View {
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                HStack {
                    Spacer()
                    Image(.logo)
                    Spacer()
                    Image(.notification)
                }
                .padding(.horizontal)
                
                SliderView()
                ActivityPanelView()
                
                HStack(spacing: 20) {
                    VisitPreparationCard(.ticket, info: "There aren't any yet.", state: "Retrieve here")
                    VisitPreparationCard(.parkHours, info: "Today, 13 Feb 10am - 5pm", state: "Plan my visit")
                }
                .padding(.horizontal, 25)
                
                UpcomingShows()
            }
        }
    }
    
    func ActivityPanelView() -> some View {
        LazyVGrid(columns: [
            GridItem(.flexible(minimum: 50)),
            GridItem(.flexible(minimum: 50)),
            GridItem(.flexible(minimum: 50)),
            GridItem(.flexible(minimum: 50)),
        ], spacing: 10) {
            ForEach(Activity.allCases, id: \.self) { item in
                ActivityButton(icon: item.icon, title: item.rawValue)
            }
        }
        .padding()
    }
    
    func ActivityButton(icon: ImageResource, title: String) -> some View {
        VStack {
            ZStack {
                Circle()
                    .fill(.gray.opacity(0.15))
                    .frame(width: 60, height: 60)
                Image(icon)
            }
            
            Text(title)
                .font(.caption)
        }
        .frame(height: 100)
    }
    
    func VisitPreparationCard(_ type: VisitPreparation, info: String, state: String) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(type.rawValue)
                    .font(.caption)
                Spacer()
                Image(type.icon)
            }
            Text(info)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(type == .ticket ? .gray : .black)
            Text(state)
                .font(.caption)
                .foregroundColor(.red)
        }
        .padding()
        .background(.white)
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.2), radius: 7, x: 0, y: 4)
    }
    
    func UpcomingShows() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Upcoming Shows")
                    .font(.title2)
                Spacer()
                Text("View all")
                    .foregroundColor(.red)
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ShowCard(image: .show1, time: "2:30 PM", showTitle: "Dive Feeding @ Shipwreck")
                    ShowCard(image: .show2, time: "2:40 PM", showTitle: "Bring Home a Marine Friend")
                }
            }
        }
        .padding()
    }
    
    func ShowCard(image: ImageResource, time: String, showTitle: String) -> some View {
        ZStack(alignment: .leading) {
            Image(image)
                .resizable()
                .scaledToFill()
            
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "clock")
                    Text(time)
                        .fontWeight(.medium)
                }
                .padding(.vertical, 3)
                .padding(.horizontal, 6)
                .background(.white)
                .cornerRadius(6)
                
                Spacer()
                
                Text(showTitle)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .padding()
        }
        .frame(width: 270)
        .cornerRadius(20)
    }
}

#Preview {
    HomeScreenView()
}
