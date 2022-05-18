//
//  KeyboardView.swift
//  ExpadableFloatingActionButton
//
//  Created by haeryu on 2022/05/16.
//

import SwiftUI

struct KeyboardView: View {
    
    var body: some View {
        ZStack {
            Color.green
            VStack {
                Text("I'm Keyboard")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .ignoresSafeArea()
    }
}

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
