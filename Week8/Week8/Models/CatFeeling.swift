//
//  CatFeeling.swift
//  Week8
//
//  Created by JunHyuk Lim on 27/6/2023.
//

import Foundation

enum CatFeeling: String {
    case brushing = "😌"
    case food = "😋"
    case isolation = "😑"
    case other = "🫥"
    
    init(rawValue: String) {
        switch rawValue.lowercased() {
        case "brushing":
            self = .brushing
        case "food":
            self = .food
        case "isolation":
            self = .isolation
        default:
            self = .other
        }
    }
}
