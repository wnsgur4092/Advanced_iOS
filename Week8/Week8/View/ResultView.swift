//
//  ResultView.swift
//  Week8
//
//  Created by JunHyuk Lim on 27/6/2023.
//

import SwiftUI

struct ResultView: View {
    // MARK: - Properties
    let results: [AnalysisResult]
    
    // MARK: - Body
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                HStack {
                    
                    Text("Probabilities:")
                        .font(.body)
                        .bold()
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                } //: HStack
                
                ForEach(results, id: \.id) { result in
                    
                    HStack {
                        
                        Text(result.feeling.rawValue)
                            .font(.custom("Arial", size: 40))
                        
                        Spacer()
                        
                        Text(result.title)
                            .font(.footnote)
                            .foregroundColor(.primary)
                            .lineLimit(1)
                            .truncationMode(.tail)
                        
                        Spacer()
                        
                        Text(String(format: "%.2f%@", result.probability, "%"))
                            .font(.footnote)
                            .foregroundColor(.primary)
                        
                    } //: HStack
                    
                } //: ForEach
 
            }
            
        } //: VStack
        
    } //: Body
    
}

// MARK: - Preview
struct ResultView_Previews: PreviewProvider {
    private static let results = [
        AnalysisResult(feeling: .food, title: "Food", probability: 79.5),
        AnalysisResult(feeling: .isolation, title: "Isolation", probability: 10.5),
        AnalysisResult(feeling: .brushing, title: "Brushing", probability: 5.3)
    ]
    
    static var previews: some View {
        ResultView(
            results: results
        )
        .preferredColorScheme(.light)
        
        
        
    }
}
