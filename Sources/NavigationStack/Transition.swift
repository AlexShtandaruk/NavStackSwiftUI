import SwiftUI

@available(iOS 13.0, *)
public enum Transition {
    case none
    case custom(AnyTransition)
}

public enum NavigationType {
    case push
    case pop
    case popToRoot
}
