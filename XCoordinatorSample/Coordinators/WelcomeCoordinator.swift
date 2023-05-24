import Foundation
import XCoordinator

enum WelcomeRoute: Route {
    case intro
    case authentication
    case doLogin
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
            let viewController = AuthViewController(router: unownedRouter)
            return .push(viewController)
        case .doLogin:
            // TODO: https://github.com/QuickBirdEng/XCoordinator/issues/103
            let homeCoordinator = HomeCoordinator()
            return .presentFullScreen(homeCoordinator, animation: .default)
        }
    }
}
