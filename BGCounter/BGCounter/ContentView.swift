//
//  ContentView.swift
//  BGCounter
//
//  Created by haeryu on 2023/05/19.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var counter = Counter.shared
    
    var body: some View {
        VStack {
            Text("Counter: \(counter.value)")
                .font(.largeTitle)
            
            Button(action: {
                BGTaskSchedulerHelper.shared.scheduleAppRefresh()
            }) {
                Text("Schedule Background Increment")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
