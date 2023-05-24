import Foundation
import XCoordinator

enum AppRoute: Route {
    case welcome
    case home
}

class AppCoordinator: NavigationCoordinator<AppRoute> {
    
    init() {
        super.init(initialRoute: .welcome)
    }
    
    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        switch(route) {
        case .welcome:
            let coordinator = WelcomeCoordinator()
            return .presentFullScreen(coordinator, animation: .default)
        case .home:
            let coordinator = HomeCoordinator()
            return .presentFullScreen(coordinator, animation: .default)
        }
    }
}
