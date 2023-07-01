import SwiftUI

@available(iOS 13.0, *)
public struct Screen: Identifiable, Equatable {
    
    public let id = UUID().uuidString
    public let view: AnyView
    
    public static func == (lhs: Screen, rhs: Screen) -> Bool {
        return lhs.id ==  rhs.id
    }
}
