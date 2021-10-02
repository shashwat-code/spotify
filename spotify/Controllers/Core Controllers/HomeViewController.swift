//
//  ViewController.swift
//  spotify
//
//  Created by Shashwat on 28/09/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    enum browseType{
        case newRelease(viewModels: [newReleasesCellViewModel] )
        case featuredPlaylist(viewModels: [newReleasesCellViewModel] )
        case recommendedPlaylist(viewModels: [newReleasesCellViewModel] )
    }
    
    var collectionView:UICollectionView = UICollectionView(frame: .zero,
                                                           collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, _ -> NSCollectionLayoutSection? in
                                                            return HomeViewController().createSectionLayout(section: sectionIndex)
                                                           })
    )
    
    // MARK:- array of all sections
    private var sections = [browseType]()
    
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
    
    //MARK:- configuring collectionViewModel
    func configureCollectionView(){
        view.addSubview(collectionView)
        collectionView.register(newReleaseCollectionViewCell.self, forCellWithReuseIdentifier: newReleaseCollectionViewCell.identifier)
        collectionView.register(featuredPlaylistCollectionViewCell.self, forCellWithReuseIdentifier: featuredPlaylistCollectionViewCell.identifier)
        collectionView.register(recommendedTrackCollectionViewCell.self, forCellWithReuseIdentifier: recommendedTrackCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource =  self
        collectionView.backgroundColor = .systemBackground
    }
    
    //MARK:- layout for sections
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
            let item = NSCollectionLayoutItem(layoutSize:  NSCollectionLayoutSize(
                                                widthDimension: .fractionalWidth(1),
                                                heightDimension: .fractionalHeight(1)))
            
            item.contentInsets = NSDirectionalEdgeInsets(
                                                top: 5,
                                                leading: 5,
                                                bottom: 5,
                                                trailing: 5)
            
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
    
    //MARK:- function for setting Button on right tabBar
    @objc func didTapSetting(){
        let vc = SettingsViewController()
        vc.title = "Settings"
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func fetchData(){
        
        let group = DispatchGroup()
        group.enter()
        group.enter()
        group.enter()
  //      group.enter()
        
        var newReleases:newReleases?
        var recommendation:recommendationModel?
        var featured:featuredPlaylistsModel?
  //      var genreRecommendation:genreRecommendation?
        
        // MARK: - fetching new releases
        APICaller.shared.getNewReleases { result in
            defer{
                group.leave()
            }
            switch(result){
            case .success(let model):
                newReleases = model
                break
            case .failure(let error):
                print(error)
                break
            }
        }
        
        // MARK: - fetching all featured playlist
        APICaller.shared.getAllFeaturedPlaylists { result in
            defer{
                group.leave()
            }
            switch(result){
            case .success(let model):
                featured = model
                break
            case .failure(let error):
                print(error)
                break
            }
        }
        
        // MARK:- fetching recommendation based on genre
//        APICaller.shared.getGenreRecommendation{ result in
//            defer{
//                group.leave()
//            }
//            switch(result){
//            case .success(let model):
//                genreRecommendation = model
//                break
//            case .failure(let error):
//                print(error)
//                break
//            }
//        }
//
        // MARK: - fetching  recommendation
        APICaller.shared.getGenreRecommendation{ result in
            switch(result){
            case .success(let model):
                let genres = model.genres
                var seed = Set<String>()
               // print(genres)
                while seed.count<5 {
                    if let element = genres.randomElement(){
                        seed.insert(element)
                    }
                }
                APICaller.shared.getRecommendations(genres: seed) { recommendedResult in
                    defer{
                        group.leave()
                    }
                    switch(recommendedResult){
                    case .success(let model):
                        recommendation = model
                        break
                    case .failure(let error):
                        print(error)
                        break
                    }
                }
                break
            case .failure(let error):
                print(error)
                break
            }
        }
        print("not entering group into")
        group.notify(queue: .main) {
            print("not entering")
            guard let newAlbum = newReleases?.albums.items,
                  let featured = featured?.playlists.items,
             //     let genre = genreRecommendation?.genres,
                  let tracks = recommendation?.tracks else{
                fatalError("models are nil")
                return
            }
            print("conf models")
            print(newAlbum.count)
            self.configureModel(newAlbums: newAlbum , featured: featured, tracks: tracks)// genre: genre)
        }
    }
    
    private func configureModel(newAlbums:[album],featured:[playlist],tracks: [track]){
        print(newAlbums.count)
        print(featured.count)
        sections.append(.featuredPlaylist(viewModels: []) )
        sections.append(.recommendedPlaylist(viewModels: []) )
        sections.append(.newRelease(viewModels: newAlbums.compactMap({
                                            return newReleasesCellViewModel(name: $0.name,
                                                                            artWorkURL: URL(string: $0.images.first?.url ?? ""),
                                                                            numberOfTrack: $0.total_tracks,
                                                                            artistName: $0.artists.first?.name ?? "-")})))
        collectionView.reloadData()
    }
}

extension HomeViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let item = sections[section]
        switch item {
        case .newRelease( let viewModels):
            print(viewModels.count)
            return viewModels.count
        case .featuredPlaylist( let viewModels):
            return viewModels.count
        case .recommendedPlaylist( let viewModels):
            return viewModels.count
      
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    //shashwat
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     //   let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
     //    cell.layer.cornerRadius = view.width/80
        let type = sections[indexPath.section]
        switch type {
        case .newRelease( let viewModels):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: newReleaseCollectionViewCell.identifier, for: indexPath) as? newReleaseCollectionViewCell else{
                return UICollectionViewCell()
            }
            cell.backgroundColor = .red
            cell.layer.cornerRadius = view.width/80
            return cell
        case .featuredPlaylist( let viewModels):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: featuredPlaylistCollectionViewCell.identifier , for: indexPath) as? featuredPlaylistCollectionViewCell else{
                return UICollectionViewCell()
            }
            cell.backgroundColor = .orange
            cell.layer.cornerRadius = view.width/80
            return cell
        case .recommendedPlaylist( let viewModels):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recommendedTrackCollectionViewCell.identifier, for: indexPath) as?
                recommendedTrackCollectionViewCell else{
                    return UICollectionViewCell()
                }
            cell.layer.cornerRadius = view.width/80
            cell.backgroundColor = .blue
            return cell
        
        }

    }
    
    
}

