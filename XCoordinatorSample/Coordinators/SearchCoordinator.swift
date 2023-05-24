import Foundation
import XCoordinator

enum SearchRoute: Route {
    case result
}

class SearchCoordinator: NavigationCoordinator<SearchRoute> {
    
    init() {
        super.init(initialRoute: .result)
    }
    
    override func prepareTransition(for route: SearchRoute) -> NavigationTransition {
        switch(route) {
        case .result:
            let viewController = SearchViewController()
            return .push(viewController)
        }
    }
    
}
