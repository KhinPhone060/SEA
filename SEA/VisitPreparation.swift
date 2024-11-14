//
//  VisitPreparation.swift
//  SEA
//
//  Created by Khin Phone Ei on 14/11/2024.
//

import SwiftUI

enum VisitPreparation: String {
    case ticket = "My e-tickets"
    case parkHours = "Park hours"
    
    var icon: ImageResource {
        switch self {
        case .ticket:
            return .ticket
        case .parkHours:
            return .clock
        }
    }
}
