import Foundation
import UIKit
import XCoordinator

class IntroViewController: UIViewController {
    private let router: UnownedRouter<WelcomeRoute>

    init(router: UnownedRouter<WelcomeRoute>) {
        self.router = router
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let label = UILabel()
        label.text = "Welcome!"
        label.font = UIFont.systemFont(ofSize: 24)
        
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        
        view.addSubview(label)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: 30),
        ])
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.heightAnchor.constraint(equalToConstant: 36),
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
        ])
    }
    
    @objc func didTapButton() {
        router.trigger(WelcomeRoute.authentication)
    }
}
