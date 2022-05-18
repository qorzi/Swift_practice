//
//  ContentView.swift
//  FloatingButtonWithCustomSheet
//
//  Created by haeryu on 2022/05/17.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    @State var showMic = false
    @State var showKeyboard = false
    @State var selectedTitle = "Main"
    
    var body: some View {
        
        let viewOffsetMaxX: CGFloat = UIScreen.main.bounds.width
        let viewOffsetMaxY: CGFloat = UIScreen.main.bounds.height
        
        ZStack {
            HomeView(selectedTitle: $selectedTitle)
                .overlay(alignment: .topLeading, content: {
                    FloatingButton(show: $show, showMic: $showMic, showKeyboard: $showKeyboard, selectedTitle: $selectedTitle)
                        .offset(x: viewOffsetMaxX - 80, y: viewOffsetMaxY - 130)
                })
            if showKeyboard {
                Color.black.opacity(0.3).ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            showKeyboard = false
                        }
                    }
                KeyboardSheet(showKeyboard: $showKeyboard)
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HomeView: View {
    @Binding var selectedTitle: String
    var body: some View {
        TabView(selection: $selectedTitle) {
            MainView()
                .tag("Main")
            SubView()
                .tag("Sub")
        }
    }
}
