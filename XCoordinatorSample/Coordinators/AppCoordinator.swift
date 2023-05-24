import Foundation
import XCoordinator

enum AppRoute: Route {
    case welcome
    case home
}

class AppCoordinator: NavigationCoordinator<AppRoute> {
    
    init() {
        super.init(initialRoute: .welcome)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(unwindToHome),
            name: NSNotification.Name("Authenticated"),
            object: nil
        )
    }
    
    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        switch(route) {
        case .welcome:
            let welcomeCoordinator = WelcomeCoordinator()
            return .presentFullScreen(welcomeCoordinator, animation: .default)
        case .home:
            let homeCoordinator = HomeCoordinator()
            return .multiple(
                .dismiss(animation: .default),
                .presentFullScreen(homeCoordinator, animation: .default)
            )
        }
    }
    
    @objc func unwindToHome() {
        self.trigger(.home, with: TransitionOptions(animated: false))
    }
}
