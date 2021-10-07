//
//  PlayerViewController.swift
//  spotify
//
//  Created by Shashwat on 28/09/21.
//

import UIKit

class PlayerViewController: UIViewController {

    var playlist: playlist
    
    init(playlist:playlist) {
        self.playlist = playlist
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = playlist.name
        view.backgroundColor = .systemRed
    }

}
