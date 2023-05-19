import SwiftUI

class Counter: ObservableObject {
    static let shared = Counter()
    
    @Published var value: Int = 0
    
    private init() {}
    
    func increment() {
        value += 1
        print("Counter incremented to \(value)")
    }
}
