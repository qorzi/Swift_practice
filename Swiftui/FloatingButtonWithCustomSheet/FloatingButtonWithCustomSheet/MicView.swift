//
//  MicView.swift
//  FloatingButtonWithCustomSheet
//
//  Created by haeryu on 2022/05/17.
//

import SwiftUI

struct MicView: View {
    @Binding var showMic: Bool
    var body: some View {
        ZStack {
            Color.pink
                .ignoresSafeArea()
            VStack {
                Text("I'm Mic")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
            }
        }
        .overlay(alignment: .topTrailing)
            {Button(action: {
                    showMic = false
                }) {
                    Text("Close")
                        .font(.title2)
                        .bold()
                }
                .foregroundColor(.white)
                .padding(20)
            }
    }
}

struct MicView_Previews: PreviewProvider {
    static var previews: some View {
        MicView(showMic: .constant(true))
    }
}
