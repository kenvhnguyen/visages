//
//  SimpleSlider.swift
//  visages
//
//  Created by Hoang Nguyen on 10/24/22.
//

import SwiftUI

struct IntSlider: View {
    @Binding var score: Int
    var intProxy: Binding<Double>{
        Binding<Double>(get: {
            //returns the score as a Double
            return Double(score)
        }, set: {
            //rounds the double to an Int
            score = Int($0)
        })
    }
    var body: some View {
        VStack{
            Slider(value: intProxy , in: 10...400, step: 40, onEditingChanged: {_ in
                print(Date().formatted() + " - Logged from View IntSlider: " + score.description)
            })
            .accentColor(.gray)
        }
    }
}

struct IntSliderView_Previews: PreviewProvider {
    @State static var score: Int = 10
    static var previews: some View {
        IntSlider(score: $score)
    }
}
