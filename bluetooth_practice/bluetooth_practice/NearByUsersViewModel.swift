// NearbyUsersViewModel.swift

import Foundation
import CoreBluetooth
import UIKit

class NearbyUsersViewModel: NSObject, ObservableObject, BluetoothManagerDelegate {
    @Published var users: [User] = []
    @Published var isScanning: Bool = false
    @Published var customName: String = ""
    
    private var bluetoothManager: BluetoothManager!

    override init() {
        super.init()
        let initialName = "시작이름"
        customName = initialName
        bluetoothManager = BluetoothManager(localName: initialName)
        bluetoothManager.delegate = self
    }


    func startScan() {
        isScanning = true
        bluetoothManager.updateLocalName(customName)
        bluetoothManager.startScan()
    }

    func stopScan() {
        isScanning = false
        bluetoothManager.stopScan()
    }
    
    func clearUsers() {
        users.removeAll()
    }
    
    func updateLocalName(_ newName: String) {
        bluetoothManager.updateLocalName(newName)
    }

    func didDiscoverUser(_ user: User, advertisementData: [String: Any]) {
        DispatchQueue.main.async { [weak self] in
            if let index = self?.users.firstIndex(where: { $0.id == user.id }) {
                // 사용자가 이미 목록에 있으면 업데이트
                self?.users[index] = user
            } else {
                // 사용자가 목록에 없으면 추가
                self?.users.append(user)
            }
        }
    }
    
}
