//
//  AuthViewController.swift
//  spotify
//
//  Created by Shashwat on 28/09/21.
//

import UIKit
import WebKit

class AuthViewController: UIViewController, WKNavigationDelegate {

    private let webView: WKWebView = {
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let config  = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        let webView = WKWebView(frame: .zero
                                , configuration: config)
        return webView
    }()
    
    public var completionHandler:((Bool)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign In"
        webView.navigationDelegate = self
        view.addSubview(webView)
        guard let urlString = AuthManager.shared.signURL else{
            return
        }
        webView.load(URLRequest(url: urlString))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        guard let url =  webView.url else{
            return
        }
        let components = URLComponents(string: url.absoluteString)
        guard let code = components?.queryItems?.first(where: {$0.name == "code" })?.value else{
            return
        }
        print("code: \(code)")
        
        webView.isHidden = true
        
        AuthManager.shared.exchangeCode(code: code) { [weak self] success in
                    DispatchQueue.main.async {
                        self?.navigationController?.popToRootViewController(animated: true)
                        self?.completionHandler?(success)
                    }
        }
    }
}
