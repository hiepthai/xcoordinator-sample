import Foundation
import XCoordinator

enum WelcomeRoute: Route {
    case intro
    case authentication
}

class WelcomeCoordinator: NavigationCoordinator<WelcomeRoute> {
    
    init() {
        super.init(initialRoute: .intro)
    }
    
    override func prepareTransition(for route: WelcomeRoute) -> NavigationTransition {
        switch(route) {
        case .intro:
            let viewController = IntroViewController(router: unownedRouter)
            return .push(viewController)
        case .authentication:
            let viewModel = AuthViewModel(router: unownedRouter)
            let viewController = AuthViewController(router: unownedRouter)
            
            viewController.bind(to: viewModel)
            return .push(viewController)
        }
    }
}
