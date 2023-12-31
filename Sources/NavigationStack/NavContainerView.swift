import SwiftUI

@available(iOS 13.0, *)
public struct NavigationContainerView<Content: View>: View {

    @ObservedObject var viewModel: NavigationContainerViewModel
    private var content: Content
    
    private let transition: (push: AnyTransition, pop: AnyTransition)
    
    public init(transition: Transition, viewModel: NavigationContainerViewModel, @ViewBuilder content: @escaping () -> Content) {
        self.content = content()
        self.viewModel = viewModel
        switch transition {
        case .custom(let anyTransition):
            self.transition = (anyTransition, anyTransition)
        case .none:
            self.transition = (.identity, .identity)
        }
    }
    public var body: some View {
        let isRoot = viewModel.currentScreen == nil
        return ZStack {
            if isRoot {
                self.content.environmentObject(self.viewModel)
                    .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
            } else {
                viewModel.currentScreen?.view.environmentObject(self.viewModel)
                    .transition(viewModel.navigationType == .push ? transition.push : transition.pop)
            }
        }
    }
}
