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
            print("problem in success value return")
            DispatchQueue.main.async {
                self?.handleSignIn(success:success)
            }
        }
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func handleSignIn(success:Bool){
        guard success else {
            let alert = UIAlertController(title: "Oops", message: "something is not right", preferredStyle: .alert )
            alert.addAction(UIAlertAction(title: "dismiss", style: .cancel, handler: nil))
            present(alert,animated: true)
            print("error captured here")
            return
        }
        let mainVC = TabBarViewController()
        print("pushing tabbarView contrller")
        mainVC.modalPresentationStyle = .fullScreen
        present(mainVC, animated: true, completion: nil)
    }
    
    
}
