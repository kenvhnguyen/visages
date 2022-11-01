//
//  SimpleSlider.swift
//  visages
//
//  Created by Hoang Nguyen on 10/24/22.
//

import SwiftUI

struct IntSlider: View {
    @Binding var range: Int
    
    var intProxy: Binding<Double>{
        Binding<Double>(get: {
            //returns the score as a Double
            return Double(range)
        }, set: {
            //rounds the double to an Int
            range = Int($0)
        })
    }
    var body: some View {
        VStack{
            Slider(value: intProxy , in: 10...500, step: 40, onEditingChanged: {_ in
                print(Date().formatted() + " - Logged from View IntSlider: " + range.description)
            })
            .accentColor(.gray)
        }
    }
}

struct IntSliderView_Previews: PreviewProvider {
    @State static var range: Int = 10
    static var previews: some View {
        IntSlider(range: $range)
    }
}
