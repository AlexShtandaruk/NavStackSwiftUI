import SwiftUI

@available(iOS 13.0, *)
public final class NavigationContainerViewModel: ObservableObject {
    
    @Published var currentScreen: Screen?
    
    var navigationType: NavigationType = .push
    
    var screenStack = NavigationStack() {
        didSet { self.currentScreen = screenStack.top() }
    }
    
    public func push(screenView: AnyView) {
        navigationType = .push
        let screen = Screen(view: screenView)
        screenStack.push(screen)
    }
    
    public func pop() {
        navigationType = .pop
        screenStack.pop()
    }
    
    
    public func popToRoot() {
        navigationType = .popToRoot
        screenStack.popToRoot()
    }
}
