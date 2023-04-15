// BluetoothManager.swift

import Foundation
import CoreBluetooth
import UIKit

protocol BluetoothManagerDelegate: AnyObject {
    func didDiscoverUser(_ user: User, advertisementData: [String: Any])
}

class BluetoothManager: NSObject, CBPeripheralManagerDelegate, CBCentralManagerDelegate {
    private var centralManager: CBCentralManager!
    private var peripheralManager: CBPeripheralManager!
    private let serviceUUID = CBUUID(string: "B6251F0B-926D-4A7C-99C5-5F937310CA9D")
    private let characteristicUUID = CBUUID(string: "AA0A496D-EFAA-4E3C-8F7B-9C4EE4F83D47")
    weak var delegate: BluetoothManagerDelegate?
    private var localName: String
    
    init(localName: String) {
        self.localName = localName
        super.init()
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }

    func startScan() {
        centralManager.scanForPeripherals(withServices: [serviceUUID], options: nil)
        if peripheralManager.state == .poweredOn {
            let service = CBMutableService(type: serviceUUID, primary: true)
            peripheralManager.add(service)

            let advertisementData: [String: Any] = [CBAdvertisementDataServiceUUIDsKey: [serviceUUID],
                                                    CBAdvertisementDataLocalNameKey: localName]
            peripheralManager.startAdvertising(advertisementData)
        }
    }

    func stopScan() {
        centralManager.stopScan()
        peripheralManager.stopAdvertising()
    }

    
    func updateLocalName(_ newName: String) {
        localName = newName
        if peripheralManager.state == .poweredOn {
            let service = CBMutableService(type: serviceUUID, primary: true)
            peripheralManager.add(service)

            let advertisementData: [String: Any] = [CBAdvertisementDataServiceUUIDsKey: [serviceUUID],
                                                    CBAdvertisementDataLocalNameKey: localName]
            peripheralManager.startAdvertising(advertisementData)
        }
    }

    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            print("Central Manager is powered on.")
        } else {
            print("Central Manager is not powered on.")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String: Any], rssi RSSI: NSNumber) {
        print("Discovered: \(peripheral)")
        
        if let name = advertisementData[CBAdvertisementDataLocalNameKey] as? String {
            let user = User(id: UUID(), name: name)
            delegate?.didDiscoverUser(user, advertisementData: advertisementData)
        }
    }
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        if peripheral.state == .poweredOn {
            print("Peripheral Manager is powered on.")
        } else {
            print("Peripheral Manager is not powered on.")
            peripheralManager.stopAdvertising()
        }
    }
    

}
