//
//  HomeView.swift
//  SlidingMenuNTabView
//
//  Created by haeryu on 2022/05/24.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var selectedTitle: String
    
    var body: some View {

        TabView(selection: $selectedTitle ) {
            MainView()
                .tag("Main")
            MemoView()
                .tag("Memo")
            DeleteView()
                .tag("Delete")
        }
        .frame(width: getRect().width)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MainView: View {
    var body: some View {
        ZStack {
            Text("MainView")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding()
        }
        .frame(width: getRect().width, alignment: .leading)
    }
}

struct MemoView: View {
    var body: some View {
        ZStack {
            Text("MemoView")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding()
        }
        .frame(width: getRect().width, alignment: .leading)
    }
}
struct DeleteView: View {
    var body: some View {
        ZStack {
            Text("DeleteView")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding()
        }
        .frame(width: getRect().width, alignment: .leading)
    }
}
