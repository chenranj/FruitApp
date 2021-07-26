//
//  OnboardingView.swift
//  Fructus
//
//  Created by Chenran Jin on 7/3/21.
//

import SwiftUI

struct OnboardingView: View {
    //MARK: -PROPERTIES
    var fruits: [Fruit] = fruitsData
    
    // MARK: -BODY
    var body: some View {
        TabView{
            ForEach(fruits[0...4]) {item in
                FruitCardView(fruit: item)
            }
        }//: TAB
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

// MARK: -PREVIEW
struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(fruits: fruitsData)
    }
}
