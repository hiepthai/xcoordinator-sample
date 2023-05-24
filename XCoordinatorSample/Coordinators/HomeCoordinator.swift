import Foundation
import XCoordinator
import UIKit

enum HomeRoute: Route {
    case search
    case chat
    case profile
}

class HomeCoordinator: TabBarCoordinator<HomeRoute> {
    
    let searchRouter: StrongRouter<SearchRoute>
    let chatRouter: StrongRouter<ChatRoute>
    let profileRouter: StrongRouter<ProfileRoute>
    
    convenience init()
    {
        let searchCoordinator = SearchCoordinator()
        searchCoordinator.rootViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)

        let chatCoordinator = ChatCoordinator()
        chatCoordinator.rootViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        
        let profileCoordinator = ProfileCoordinator()
        profileCoordinator.rootViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)

        self.init(
            searchRouter: searchCoordinator.strongRouter,
            chatRouter: chatCoordinator.strongRouter,
            profileRouter: profileCoordinator.strongRouter
        )
    }

    init(searchRouter: StrongRouter<SearchRoute>, chatRouter: StrongRouter<ChatRoute>, profileRouter: StrongRouter<ProfileRoute>)
    {
        self.searchRouter = searchRouter
        self.chatRouter = chatRouter
        self.profileRouter = profileRouter

        super.init(tabs: [searchRouter, chatRouter, profileRouter], select: chatRouter)
    }
    
    override func prepareTransition(for route: HomeRoute) -> TabBarTransition {
        switch(route) {
        case .chat:
            return .select(chatRouter)
        case .search:
            return .select(searchRouter)
        case .profile:
            return .select(profileRouter)
        }
    }
}
