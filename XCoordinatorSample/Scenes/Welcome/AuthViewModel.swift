import Foundation
import XCoordinator

class AuthViewModel {
    private let router: UnownedRouter<WelcomeRoute>
    
    init(router: UnownedRouter<WelcomeRoute>) {
        self.router = router
        
        DispatchQueue.main.async {
            self.printOut()
        }
    }
    
    func printOut() {
        print("Hold self reference")
    }
}
