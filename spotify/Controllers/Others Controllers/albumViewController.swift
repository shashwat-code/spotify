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
        view.backgroundColor = .systemRed
    }
    

}
