//
//  albumViewController.swift
//  spotify
//
//  Created by Shashwat on 05/10/21.
//

import UIKit

class albumViewController: UIViewController {

    
    var album: album
    
    init(album:album) {
        self.album = album
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = album.name
        navigationItem.largeTitleDisplayMode = .never
        
       // print(album.id)
        DispatchQueue.main.async {
            APICaller.shared.getAlbumDetails(album: self.album) { result in
                switch result{
                case .success(let model):
                    print(model)
                    break
                case .failure(let error):
                    print(error)
                    break
                }
            }
        }
        view.backgroundColor = .systemRed
    }
    

}
