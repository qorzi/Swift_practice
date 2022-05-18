//
//  KeyboardSheet.swift
//  ExpadableFloatingActionButton
//
//  Created by haeryu on 2022/05/16.
//

import SwiftUI

struct KeyboardSheet: View {
    @State var translation: CGSize = .zero
    @State var offsetY: CGFloat = 0
    @Binding var showKeyboard: Bool
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                KeyboardView()
                    .overlay(alignment: .top, content: {
                        Button(action: {
                            withAnimation(.easeInOut) {
                                showKeyboard = false
                            }
                        }) {
                            RoundedRectangle(cornerRadius: 3, style: .continuous)
                                .frame(width: 40, height: 5)
                        }
                        .foregroundColor(.white)
                        .font(.system(size: 30, weight: .semibold, design: .default))
                        .padding(10)
                    })
            }
            .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .ignoresSafeArea(edges: .bottom)
            .offset(y: (translation.height + offsetY) > 0 ? translation.height + offsetY : 0)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        translation = value.translation
                    }
                    .onEnded { value in
                        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.8)) {
                            let snap = translation.height + offsetY
                            let quarter = proxy.size.height/4

                            if snap > quarter && snap < quarter*3 {
                                offsetY = quarter*2
                            } else if snap > quarter*3 {
                                offsetY = quarter*4 - 50
                            } else {
                                offsetY = 0
                            }
                            translation = .zero
                        }
                    }
        )
        }
    }
}

struct KeyboardSheet_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardSheet(showKeyboard: .constant(true))
    }
}
