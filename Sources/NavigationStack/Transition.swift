import SwiftUI

@available(iOS 13.0, *)
enum Transition {
    case none
    case custom(AnyTransition)
}

 enum NavigationType {
    case push
    case pop
    case popToRoot
}
