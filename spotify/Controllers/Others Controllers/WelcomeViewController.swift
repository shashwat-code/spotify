//
//  WelcomeViewController.swift
//  spotify
//
//  Created by Shashwat on 28/09/21.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    
    var SignInButton:UIButton = {
        let button = UIButton()
        button.setTitle("Sign In with Spotify", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Spotify"
        view.backgroundColor = .systemGreen
        view.addSubview(SignInButton)
        SignInButton.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        SignInButton.frame = CGRect(x: 20,
                                    y: view.height - 50 - view.safeAreaInsets.bottom,
                                    width: view.width - 40,
                                    height: 50)
        print("")
    }
    
    @objc func signInTapped(){
        let vc = AuthViewController()
        vc.completionHandler = { [weak self] success in
            DispatchQueue.main.async {
                self?.handleSignIn(success:success)
            }
        }
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func handleSignIn(success:Bool){
        // log user in 
    }
    
    
}
