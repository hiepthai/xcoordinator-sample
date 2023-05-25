import Foundation
import XCoordinator

enum AppRoute: Route {
    case welcome
    case home
}

class AppCoordinator: NavigationCoordinator<AppRoute> {
    
    init() {
        if UserDefaults.standard.bool(forKey: "AUTHENTICATED") { // check whether user logged or not
            super.init(initialRoute: .home)
        } else {
            super.init(initialRoute: .welcome)
        }
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(unwindToHome),
            name: NSNotification.Name("Authenticated"),
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(unwindToWelcome),
            name: NSNotification.Name("Unauthenticated"),
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
            return .presentFullScreen(homeCoordinator)
        }
    }
    
    @objc func unwindToHome() {
        self.rootViewController.dismiss(animated: false) {
            self.trigger(.home, with: TransitionOptions(animated: false))
        }
    }
    
    @objc func unwindToWelcome() {
        self.rootViewController.dismiss(animated: false) {
            self.trigger(.welcome, with: TransitionOptions(animated: false))
        }
    }
}
