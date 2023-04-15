//
//  bluetooth_practiceApp.swift
//  bluetooth_practice
//
//  Created by haeryu on 2023/04/12.
//

import SwiftUI

@main
struct bluetooth_practiceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(nearbyUsersViewModel: NearbyUsersViewModel())
        }
    }
}
