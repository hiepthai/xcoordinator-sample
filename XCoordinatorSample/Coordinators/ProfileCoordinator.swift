import Foundation
import XCoordinator

enum ProfileRoute: Route {
    case me
    case user(String)
    case logout
}

class ProfileCoordinator: NavigationCoordinator<ProfileRoute> {
    
    init() {
        super.init(initialRoute: .me)
    }
    
    override func prepareTransition(for route: ProfileRoute) -> NavigationTransition {
        switch(route) {
        case .me:
            let viewController = ProfileViewController(router: unownedRouter)
            return .push(viewController)
        case let .user(username):
            print("view profile of \(username)")
            let viewController = ProfileViewController(router: unownedRouter)
            return .push(viewController)
        case .logout:
            return .dismiss()
        }
    }
}
