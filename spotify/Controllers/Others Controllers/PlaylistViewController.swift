//
//  PlaylistViewController.swift
//  spotify
//
//  Created by Shashwat on 28/09/21.
//
import UIKit

class PlaylistViewController: UIViewController {
    
    let playlist:playlist
    
    
    var collectionView: UICollectionView = UICollectionView(frame: .zero,
                                                            collectionViewLayout: UICollectionViewCompositionalLayout(sectionProvider: { _, _ -> NSCollectionLayoutSection in
    let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                         heightDimension: .fractionalHeight(1)))
                                                                
    item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 2, bottom: 4, trailing: 2)
                                                                
    let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                                    heightDimension: .fractionalHeight(0.07)),
                                                                                    subitem: item,count: 1)
                                                                
    let section = NSCollectionLayoutSection(group: group)
     section.boundarySupplementaryItems = [NSCollectionLayoutBoundarySupplementaryItem(
                                            layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1)) ,
                                            elementKind: UICollectionView.elementKindSectionHeader,
                                            alignment: .top)]
    return section
                                                                
                                                            }))
    
    init(playlist:playlist) {
        self.playlist = playlist
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var viewModels = [recommendedTrackViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = playlist.name
        view.addSubview(collectionView)
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationItem.setHidesBackButton(false, animated: true)
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(recommendedTrackCollectionViewCell.self,
                                forCellWithReuseIdentifier: recommendedTrackCollectionViewCell.identifier)
        collectionView.register(playlistHeaderCollectionReusableView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: playlistHeaderCollectionReusableView.identifier)
        DispatchQueue.main.async {
            APICaller.shared.getPlaylistDetails(playlist: self.playlist) { result in
                switch(result){
                case .success(let model):
                    DispatchQueue.main.async {
                        self.viewModels = model.tracks.items.compactMap({recommendedTrackViewModel(name: $0.track.name,
                                                                                                   artworkURL:URL(string: $0.track.album?.images.first?.url ?? " "),
                                                                                                   artistName:$0.track.artists.first?.name ?? "-"
                                                                                                   )
                        })
                        self.collectionView.reloadData()
                    }
                //    print(self.viewModels)
                    break
                case .failure(let error):
                    print(error)
                    break
                }
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
       
    }
}

extension PlaylistViewController : UICollectionViewDelegate,UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        print(viewModels)
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("count : \(viewModels.count)")
        return viewModels.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader,
              let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: playlistHeaderCollectionReusableView.identifier, for: indexPath) as? playlistHeaderCollectionReusableView else{
            return UICollectionReusableView()
        }
        
        let viewModel = headerPlaylistViewModel(name: playlist.name,
                                                desc: playlist.description,
                                                artworkURL: URL(string:playlist.images.first?.url ?? " "))
        header.configure(with: viewModel)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recommendedTrackCollectionViewCell.identifier,
                                                            for: indexPath)
                as? recommendedTrackCollectionViewCell
        else {
            print("this in not true")
            return UICollectionViewCell()
        }
        print(viewModels[indexPath.row])
        cell.configure(with: viewModels[indexPath.row])
   //     cell.configure(with: viewModels[indexPath.row])
        return cell
        
    }
    
    
}
