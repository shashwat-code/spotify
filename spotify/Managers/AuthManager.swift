//
//  AuthManager.swift
//  spotify
//
//  Created by Shashwat on 28/09/21.
//

import Foundation

class AuthManager{
    static let  shared = AuthManager()
    init() {
        
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
}
