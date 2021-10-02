//
//  ViewController.swift
//  spotify
//
//  Created by Shashwat on 28/09/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    enum browseType{
        case newRelease
        case featuredPlaylist
        case recommendedPlaylist
    }
    
    var collectionView:UICollectionView = UICollectionView(frame: .zero,
                                                           collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, _ -> NSCollectionLayoutSection? in
                                                            return HomeViewController().createSectionLayout(section: sectionIndex)
                                                           })
    )
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "gear"), style: .done, target: self, action: #selector(didTapSetting))
        fetchData()
        configureCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    func configureCollectionView(){
        view.addSubview(collectionView)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.dataSource =  self
        collectionView.backgroundColor = .systemBackground
    }
    
    func createSectionLayout(section:Int)-> NSCollectionLayoutSection{
        
        switch section {
        case 1:
            let item = NSCollectionLayoutItem(layoutSize:  NSCollectionLayoutSize(
                                                widthDimension: .fractionalWidth(1),
                                                heightDimension: .fractionalWidth(1)))
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 2,
                                                         leading: 2,
                                                         bottom: 2,
                                                         trailing: 2)
            
            let verticalGroup = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .absolute(250),
                    heightDimension: .absolute(250)),
                    subitem: item,
                    count: 1)
            
            let horizontalGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .absolute(250) ,
                    heightDimension: .absolute(250)),
                    subitem: verticalGroup,
                    count: 1)
            
            let section = NSCollectionLayoutSection(group: horizontalGroup)
            section.orthogonalScrollingBehavior = .continuous
            return section
        case 2:
            let item = NSCollectionLayoutItem(layoutSize:  NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
            
            let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0) , heightDimension: .absolute(240)), subitem: item,count: 3)
            let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9) , heightDimension: .absolute(240)), subitem: verticalGroup,count: 2)
            let section = NSCollectionLayoutSection(group: horizontalGroup)
            section.orthogonalScrollingBehavior = .groupPaging
            return section
        case 3:
            let item = NSCollectionLayoutItem(layoutSize:  NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
            
            let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0) , heightDimension: .absolute(240)), subitem: item,count: 3)
            let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9) , heightDimension: .absolute(240)), subitem: verticalGroup,count: 2)
            let section = NSCollectionLayoutSection(group: horizontalGroup)
            section.orthogonalScrollingBehavior = .groupPaging
            return section
        case 4:
            let item = NSCollectionLayoutItem(layoutSize:  NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
            
            let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0) , heightDimension: .absolute(240)), subitem: item,count: 3)
            let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9) , heightDimension: .absolute(240)), subitem: verticalGroup,count: 2)
            let section = NSCollectionLayoutSection(group: horizontalGroup)
            section.orthogonalScrollingBehavior = .groupPaging
            return section
        case 5:
            let item = NSCollectionLayoutItem(layoutSize:  NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
            
            let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0) , heightDimension: .absolute(240)), subitem: item,count: 3)
            let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9) , heightDimension: .absolute(240)), subitem: verticalGroup,count: 2)
            let section = NSCollectionLayoutSection(group: horizontalGroup)
            section.orthogonalScrollingBehavior = .groupPaging
            return section
        default:
            let item = NSCollectionLayoutItem(layoutSize:  NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
            
            item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
            
            let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0) , heightDimension: .absolute(240)), subitem: item,count: 3)
            let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9) , heightDimension: .absolute(240)), subitem: verticalGroup,count: 2)
            let section = NSCollectionLayoutSection(group: horizontalGroup)
            section.orthogonalScrollingBehavior = .groupPaging
            return section
        }
    }
    
    @objc func didTapSetting(){
        let vc = SettingsViewController()
        vc.title = "Settings"
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func fetchData(){
        
        // MARK: - fetching new releases
        APICaller.shared.getNewReleases { result in
            switch(result){
            case .success(let model):
                break
            case .failure(let error):
                break
            }
        }
        
        // MARK: - fetching all featured playlist
        APICaller.shared.getAllFeaturedPlaylists { result in
            switch(result){
            case .success(let model):
                break
            case .failure(let error):
                break
            }
        }
        
        // MARK:- fetching recommendation based on genre
        APICaller.shared.getGenreRecommendation{ result in
            switch(result){
            case .success(let model):
                break
            case .failure(let error):
                break
            }
        }
        
        // MARK: - fetching  recommendation
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

extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    //shashwat
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.layer.cornerRadius = view.width/80
        
        if indexPath.section == 0{
            cell.backgroundColor = .systemBlue
        }else if indexPath.section == 1{
          //  cell.layer.cornerRadius = 120
            cell.backgroundColor = .systemRed
           // cell.layer.cornerRadius = 125
        }else if indexPath.section == 2{
            cell.backgroundColor = .systemPink
        }else if indexPath.section == 3{
            cell.backgroundColor = .systemGray
         //   cell.layer.cornerRadius = 100
        }else if indexPath.section == 4{
            cell.backgroundColor = .systemTeal
            
        }
        return cell
    }
    
    
}

