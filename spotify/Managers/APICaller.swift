//
//  APICaller.swift
//  spotify
//
//  Created by Shashwat on 28/09/21.
//

import Foundation

final class APICaller{
    static let shared = APICaller()
    
    struct Constants {
        static let base = "https://api.spotify.com/v1"
    }
    
    func getCurrentProfile(completion: @escaping (Result<UserProfile,Error>)->Void){
        createRequest(url: URL(string: Constants.base + "/me"), method: .GET) { baseRequest in
            let task = URLSession.shared.dataTask(with: baseRequest) { data, response, error in
                guard let data = data , error == nil else{
                    return }
                do{
                    let json = try JSONDecoder().decode(UserProfile.self, from: data)
                    let json1 = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    print(json1)
                    print(json)
                    completion(.success(json))
                }catch{
                    print(error)
                    print(error.localizedDescription)
                    print("error found while parsing the value")
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    enum HTTPMethod:String {
        case GET
        case POST
    }
    
    func createRequest(url: URL?,
                       method: HTTPMethod,
                       completion: @escaping ((URLRequest)->Void)){
        AuthManager.shared.withValideToken { token in
            guard let APIurl = url else{
                return
            }
            var request = URLRequest(url: APIurl)
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.httpMethod = method.rawValue
            request.timeoutInterval = 30
            completion(request)
        }
        
    }
}
