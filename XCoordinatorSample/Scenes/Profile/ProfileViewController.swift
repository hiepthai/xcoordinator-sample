import Foundation
import UIKit
import XCoordinator

class ProfileViewController: UIViewController {
    private let router: UnownedRouter<ProfileRoute>

    init(router: UnownedRouter<ProfileRoute>) {
        self.router = router
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton()
        button.setTitle("Log out", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 36),
        ])
    }
 
    @objc func didTapButton() {
        UserDefaults.standard.set(false, forKey: "AUTHENTICATED")
        NotificationCenter.default.post(name: NSNotification.Name("Unauthenticated"), object: nil)
    }
}
