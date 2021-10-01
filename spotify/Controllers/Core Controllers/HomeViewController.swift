//
//  ViewController.swift
//  spotify
//
//  Created by Shashwat on 28/09/21.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapSetting))
        fetchData()
    }
    @objc func didTapSetting(){
        let vc = SettingsViewController()
        vc.title = "Settings"
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func fetchData(){
//        APICaller.shared.getNewReleases { result in
//            switch(result){
//            case .success(let model):
//                break
//            case .failure(let error):
//                break
//            }
//        }
//        APICaller.shared.getAllFeaturedPlaylists { result in
//            switch(result){
//            case .success(let model):
//                break
//            case .failure(let error):
//                break
//            }
//        }
        
        APICaller.shared.getGenreRecommendation{ result in
            switch(result){
            case .success(let model):
                let genres = model.genres
                var seed = Set<String>()
                print(genres)
                while seed.count<5 {
                    if let element = genres.randomElement(){
                        seed.insert(element)
                    }
                }
                print("seed are: \(seed)")
                APICaller.shared.getRecommendations(genres: seed) { result in
                    print("get recommnedation function in home view controller")
                    switch(result){
                    case .success(let model):
                        break
                    case .failure(let error):
                        break
                    }
                }
                break
            case .failure(let error):
                break
            }
        }
    }


}

