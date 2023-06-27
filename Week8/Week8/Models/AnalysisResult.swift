//
//  AnalysisResult.swift
//  Week8
//
//  Created by JunHyuk Lim on 27/6/2023.
//

import Foundation

struct AnalysisResult: Identifiable {
    let id: UUID = UUID()
    let feeling: CatFeeling
    let title: String
    let probability: Double
}
