import Foundation
import XCoordinator

enum ChatRoute: Route {
    case channels
}

class ChatCoordinator: NavigationCoordinator<ChatRoute> {
    init() {
        super.init(initialRoute: .channels)
    }
    
    override func prepareTransition(for route: ChatRoute) -> NavigationTransition {
        switch(route) {
        case .channels:
            let viewController = ChannelsViewController()
            return .push(viewController)
        }
    }
}
