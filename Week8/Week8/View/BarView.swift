//
//  BarView.swift
//  Week8
//
//  Created by JunHyuk Lim on 27/6/2023.
//

import SwiftUI

struct BarView: View, Animatable {
    // MARK: - Properties
    let frequencyWidth: CGFloat
    let numberOfSamples: Int
    var value: CGFloat
    
    var animatableData: CGFloat {
        get { value }
        set { value = newValue }
    }

    private var width: CGFloat {
        return (frequencyWidth - CGFloat(numberOfSamples) * 4) / CGFloat(numberOfSamples)
    }
    
    // MARK: - Body
    var body: some View {

        ZStack {
            
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [.purple, .blue]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(
                    width: width,
                    height: value
                )
            
        } //: ZStack
        
    }
    
}

//MARK: - PREVIEW
//struct BarView_Previews: PreviewProvider {
//    static var previews: some View {
//        BarView(frequencyWidth: <#CGFloat#>, numberOfSamples: <#Int#>, value: <#CGFloat#>)
//    }
//}
