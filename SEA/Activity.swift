//
//  Activity.swift
//  SEA
//
//  Created by Khin Phone Ei on 14/11/2024.
//

import SwiftUI

enum Activity: String, CaseIterable {
    case map = "Map"
    case inhabitants = "Inhabitants"
    case shows = "Shows"
    case shopping = "Shopping"
    case dine = "Dine"
    case meetAndGreets = "Meet & Greets"
    
    var icon: ImageResource {
        switch self {
        case .map:
            return .location
        case .inhabitants:
            return .fish
        case .shows:
            return .alphabet
        case .shopping:
            return .bag
        case .dine:
            return .utensils
        case .meetAndGreets:
            return .conversation
        }
    }
}
