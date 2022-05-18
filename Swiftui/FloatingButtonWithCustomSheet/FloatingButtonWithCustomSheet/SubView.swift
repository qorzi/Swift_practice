//
//  SubView.swift
//  FloatingButtonWithCustomSheet
//
//  Created by haeryu on 2022/05/17.
//

import SwiftUI

struct SubView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                Text("Custom Sheet")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
            }
        }
    }
}

struct SubView_Previews: PreviewProvider {
    static var previews: some View {
        SubView()
    }
}
