//    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
//        if peripheral.state == .poweredOn {
//            let service = CBMutableService(type: serviceUUID, primary: true)
//            let characteristic = CBMutableCharacteristic(type: characteristicUUID, properties: .read, value: nil, permissions: .readable)
//            service.characteristics = [characteristic]
//            peripheralManager.add(service)
//
//            let advertisementData: [String: Any] = [CBAdvertisementDataServiceUUIDsKey: [serviceUUID],
//                                                    CBAdvertisementDataLocalNameKey: localName]
//            peripheralManager.startAdvertising(advertisementData)
//
//        } else {
//            peripheralManager.stopAdvertising()
//        }
//    }
