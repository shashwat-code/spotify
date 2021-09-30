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
        static let clientSecret = "3c249ade624f495aaed7c27081736544"
        static let tokenAPIURL = "https://accounts.spotify.com/api/token"
        static let redirectURI = "https://www.iosacademy.io"
        static let scopes = "user-read-private%20playlist-modify-public%20playlist-read-private%20playlist-modify-private%20user-follow-read%20user-library-modify%20user-library-read%20user-read-email"
    }
    
    
    public var signURL: URL?{
        let base = "https://accounts.spotify.com/authorize"
        let scope = "user-read-private"
        let urlString = "\(base)?response_type=code&client_id=\(Constants.clientID)&scope=\(scope)&redirect_uri=\(Constants.redirectURI)&show_dialog=TRUE"
        return URL(string: urlString)
        
        
    }
    
    var isSignedIn: Bool{
        return (accessToken != nil)
    }
    var accessToken:String?{
        return UserDefaults.standard.string(forKey: "access_token")
    }
    var refreshtoken:String?{
        return UserDefaults.standard.string(forKey: "refresh_token")
    }
    var tokenExpirationDate:Date?{
        return UserDefaults.standard.object(forKey: "expires_in") as? Date
    }
    
    var shouldRefreshToken:Bool{
        guard let expiry = tokenExpirationDate else{
            return false
        }
        let current = Date()
        let fiveminute:TimeInterval = 300
        return current.addingTimeInterval(fiveminute) >= expiry 
    }
    
    
    public func exchangeCode(code:String,completion: @escaping ((Bool)->Void)){
        guard let url = URL(string: Constants.tokenAPIURL) else{
            return
        }
        
        var components  = URLComponents()
        components.queryItems = [URLQueryItem(name: "grant_type", value: "authorization_code"),
                                 URLQueryItem(name: "code", value: code),
                                 URLQueryItem(name: "redirect_uri", value: Constants.redirectURI)
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded ", forHTTPHeaderField: "Content-Type")
        request.httpBody = components.query?.data(using: .utf8)
        let basicToken = Constants.clientID+":"+Constants.clientSecret
        let data = basicToken.data(using: .utf8)
        guard let basic64Token = data?.base64EncodedString() else{
            print("failure")
            completion(false)
            return
        }
        request.setValue("Basic \(basic64Token)", forHTTPHeaderField: "Authorization")
        request.httpBody = components.query?.data(using: .utf8)
        URLSession.shared.dataTask(with: request){[weak self] data,response,error in
            guard let data = data, error == nil else{
                completion(false)
                print("we are inside exchangeCode function ")
                return
            }
            do{
                let result = try JSONDecoder().decode(AuthResponse.self,from:data)
                self?.cacheToken(result:result)
                print("success: \(result)")
            }catch{
                print(error.localizedDescription)
                completion(false)
            }
        }.resume()
    }
    
    
    public func refreshIfNeeded(completion: @escaping ((Bool)->Void)){
        guard shouldRefreshToken else{
            completion(true)
            return
        }
        
        guard let refreshToken = self.refreshtoken else{
            return
        }
        
        guard let url = URL(string: Constants.tokenAPIURL) else{
            return
        }
        
        var components  = URLComponents()
        components.queryItems = [URLQueryItem(name: "grant_type", value: "refresh_token"),
                                 URLQueryItem(name: "refresh_token", value: refreshToken)]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded ", forHTTPHeaderField: "Content-Type")
        request.httpBody = components.query?.data(using: .utf8)
        let basicToken = Constants.clientID+":"+Constants.clientSecret
        let data = basicToken.data(using: .utf8)
        guard let basic64Token = data?.base64EncodedString() else{
            print("failure")
            completion(false)
            return
        }
        
        request.setValue("Basic \(basic64Token)", forHTTPHeaderField: "Authorization")
        request.httpBody = components.query?.data(using: .utf8)
        URLSession.shared.dataTask(with: request){[weak self] data,response,error in
            guard let data = data, error == nil else{
                completion(false)
                print("we are inside exchangeCode function ")
                return
            }
            do{
                let result = try JSONDecoder().decode(AuthResponse.self,from:data)
                self?.cacheToken(result:result)
                print("success: \(result)")
            }catch{
                print(error.localizedDescription)
                completion(false)
            }
        }.resume()
    }
    
    
    public func cacheToken(result:AuthResponse){
        UserDefaults().setValue(result.access_token, forKey: "access_token")
        if let refresh_token = result.refresh_token {
            UserDefaults().setValue(refresh_token, forKey: "refresh_token")
        }
        UserDefaults().setValue(Date().addingTimeInterval(TimeInterval(result.expires_in)), forKey: "expires_in")
        
        
    }
}
