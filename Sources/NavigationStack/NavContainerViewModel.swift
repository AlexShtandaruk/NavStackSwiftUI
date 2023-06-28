import SwiftUI

@available(iOS 13.0, *)
final class NavContainerViewModel: ObservableObject {
    
    @Published var currentScreen: Screen?
    
    var navigationType: NavigationType = .push
    
    var screenStack = NavStack() {
        didSet { self.currentScreen = screenStack.top() }
    }
    
    func push(screenView: AnyView) {
        navigationType = .push
        let screen = Screen(view: screenView)
        screenStack.push(screen)
    }
    
    func pop() {
        navigationType = .pop
        screenStack.pop()
    }
    
    
    func popToRoot() {
        navigationType = .popToRoot
        screenStack.popToRoot()
    }
}
