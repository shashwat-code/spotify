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
    
    // MARK: - get new releases
    func getNewReleases(completion: @escaping (Result<newReleases,Error>)->Void){
        let baseRequest = Constants.base + "/browse/new-releases/?country=IN&limit=50"
        createRequest(url: URL(string: baseRequest), method: .GET) { request in
         //   print(baseRequest)
            let task = URLSession.shared.dataTask(with: request){data,_,error in
                guard let data = data , error == nil else{
                    return
                }
                do{
                    let json = try JSONDecoder().decode(newReleases.self, from: data)
                //    print(json)
                    completion(.success(json))
                }catch{
                    print(error)
              //      print(error.localizedDescription)
                    completion(.failure(error))
                    
                }
            }
            task.resume()
        }
    
    }
    
    // MARK: - get all featured playlist
    func getAllFeaturedPlaylists(completion: @escaping ((Result<featuredPlaylistsModel,Error>)->Void)){
        let base = (Constants.base + "/browse/featured-playlists/?country=IN&limit=50")
        createRequest(url: URL(string: base), method: .GET) { url in
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data=data, error==nil else{
                    return
                }
                
                do{
                    let json = try JSONDecoder().decode(featuredPlaylistsModel.self, from: data)
                //    let j = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    completion(.success(json))
                   // print("this json: \(j)")
                    print("this is json file: ",json.playlists)
                }catch{
                    print(error)
                //    print(error.localizedDescription)
                }
            }
            task.resume()
            
        }
        
    }
    
    // MARK: - fetch profile
    func getCurrentProfile(completion: @escaping (Result<UserProfile,Error>)->Void){
        createRequest(url: URL(string: Constants.base + "/me"), method: .GET) { baseRequest in
            let task = URLSession.shared.dataTask(with: baseRequest) { data, response, error in
                guard let data = data , error == nil else{
                    return }
                do{
                    let json = try JSONDecoder().decode(UserProfile.self, from: data)
              //      print(json)
                    completion(.success(json))
                }catch{
                    print(error)
               //     print(error.localizedDescription)
               //     print("error found while parsing the value")
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    // MARK: - get recommendation
    func getRecommendations(genres:Set<String>,completion: @escaping ((Result<recommendationModel,Error>)->Void)){
        let seed = genres.joined(separator: ",")
        createRequest(url: URL(string: Constants.base + "/recommendations?limit=40&seed_genres=\(seed)"), method: .GET) { baseRequest in
            let task = URLSession.shared.dataTask(with: baseRequest) { data, _, error in
                guard let data = data , error == nil else{
                    return
                }
                do{
                    let json = try JSONDecoder().decode(recommendationModel.self, from: data)
                    completion(.success(json))
             //       print(json)
                }catch{
                    print(error)
             //       print("error")
                }
            }
            task.resume()
        }
    }
    
    // MARK: - genre recommendation
    func getGenreRecommendation(completion: @escaping ((Result<genreRecommendation,Error>)->Void)){
                createRequest(url: URL(string: Constants.base + "/recommendations/available-genre-seeds"), method: .GET) { baseRequest in
                    let task = URLSession.shared.dataTask(with: baseRequest) { data, _, error in
                        guard let data = data , error == nil else{
                            return
                        }
                        do{
                            let json = try JSONDecoder().decode(genreRecommendation.self, from: data)
                            completion(.success(json))
                        }catch{
               //             print("error")
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
    
    // MARK: - this function creates request
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
