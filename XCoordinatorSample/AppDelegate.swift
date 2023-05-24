import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    private lazy var mainWindow = UIWindow()
    private let router = AppCoordinator().strongRouter

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        router.setRoot(for: mainWindow)

        setupDefaultAppearance()
        
        return true
    }
    
    private func setupDefaultAppearance() {
        UIView.appearance().overrideUserInterfaceStyle = .light
        UIView.appearance().backgroundColor = .white
        
        UILabel.appearance().translatesAutoresizingMaskIntoConstraints = false
        
        UIButton.appearance().translatesAutoresizingMaskIntoConstraints = false
    }
}

