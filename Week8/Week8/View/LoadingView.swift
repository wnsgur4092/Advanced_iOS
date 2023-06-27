//
//  LoadingView.swift
//  Week8
//
//  Created by JunHyuk Lim on 27/6/2023.
//

import SwiftUI

struct LoadingView: View {
    
    // MARK: - Body
    var body: some View {
        
        VStack {
            
            ProgressView(label: {
                
                Text("Loading...")
                
            }) //: ProgressView
            .tint(.primary)
            .foregroundColor(.primary)
            .progressViewStyle(.circular)
            
        } //: VStack
        .padding()
        
    } //: Body
    
}

// MARK: - Preview
struct LoadingView_Previews: PreviewProvider {
    
    static var previews: some View {
        LoadingView()
    }
    
}
