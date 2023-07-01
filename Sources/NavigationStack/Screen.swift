import SwiftUI

@available(iOS 13.0, *)
public struct Screen: Identifiable, Equatable {
    
    let id = UUID().uuidString
    let view: AnyView
    
    static func == (lhs: Screen, rhs: Screen) -> Bool {
        return lhs.id ==  rhs.id
    }
}
