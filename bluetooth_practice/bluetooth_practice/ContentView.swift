// ContentView.swift

import SwiftUI

struct ContentView: View {
    @ObservedObject var nearbyUsersViewModel: NearbyUsersViewModel
    @State private var customName: String = ""

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter your custom name", text: $customName)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                List(nearbyUsersViewModel.users) { user in
                    UserRow(user: user)
                }
                .navigationTitle("Nearby Users")

                HStack {
                    Button(action: {
                        nearbyUsersViewModel.updateLocalName(customName)
                        nearbyUsersViewModel.startScan()
                    }) {
                        Text("Scan")
                            .padding()
                            .background(nearbyUsersViewModel.isScanning ? Color.gray : Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .disabled(nearbyUsersViewModel.isScanning)
                    .padding()

                    Button(action: {
                        nearbyUsersViewModel.stopScan()
                        nearbyUsersViewModel.clearUsers()
                    }) {
                        Text("Stop")
                            .padding()
                            .background(!nearbyUsersViewModel.isScanning ? Color.gray : Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .disabled(!nearbyUsersViewModel.isScanning)
                    .padding()
                }
            }
        }
    }
}

struct UserRow: View {
    let user: User

    var body: some View {
        HStack {
            Text(user.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(nearbyUsersViewModel: NearbyUsersViewModel())
    }
}
