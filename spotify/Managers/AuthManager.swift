//
//  AuthManager.swift
//  spotify
//
//  Created by Shashwat on 28/09/21.
//

import Foundation


final class AuthManager{
    
    static let  shared = AuthManager()
    
    init() {}
    
    struct Constants {
        static let clientID = "310aa8907ceb40c0a34302b23a8fa47a"
        static let clientSecret = "e294deef65b2408592edf40af304ee20"
    }

    
    public var signURL: URL?{
        let base = "https://accounts.spotify.com/authorize"
        let scope = "user-read-private"
        let URI = "https://www.iosacademy.io"
        let urlString = "\(base)?response_type=code&client_id=\(Constants.clientID)&scope=\(scope)&redirect_uri=\(URI)&show_dialog=TRUE"
        return URL(string: urlString)
        
        
    }
    
    var isSignedIn: Bool{
        return false
    }
    var accessToken:String?{
        return nil
    }
    var refreshtoken:String?{
        return nil
    }
    var tokenExpirationDate:Date?{
        return nil
    }
    
    var shouldRefreshToken:Bool{
        return false
    }
    public func exchangeCode(code:String,completion: @escaping ((Bool)->Void)){
        
    }
}
