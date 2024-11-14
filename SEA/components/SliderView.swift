//
//  SliderView.swift
//  SEA
//
//  Created by Khin Phone Ei on 14/11/2024.
//

import SwiftUI

struct SliderView: View {
    @State private var currentSlide = 0
    
    let images: [ImageResource] = [.slide1, .slide2, .slide3]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $currentSlide) {
                ForEach(Array(images.enumerated()), id: \.element) { (index, image) in
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            HStack(spacing: 8) {
                ForEach(0..<images.count, id: \..self) { index in
                    RoundedRectangle(cornerRadius: 10)
                        .fill(index == currentSlide ? .red : .gray)
                        .frame(width: 35, height: 7)
                }
            }
            .padding(.bottom)
        }
        .frame(height: UIScreen.main.bounds.height * 0.243)
        .onAppear {
            startAutoSlide()
        }
    }
    
    func startAutoSlide() {
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { timer in
            withAnimation {
                currentSlide = (currentSlide + 1) % images.count
            }
        }
    }
}

#Preview {
    SliderView()
}
