//
//  playlistHeaderCollectionReusableView.swift
//  spotify
//
//  Created by Shashwat on 06/10/21.
//

import UIKit
import SDWebImage

final class playlistHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "playlistHeader"
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        addSubview(playlistName)
        addSubview(imageView)
        addSubview(desc)
    }
    
    let desc: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let playlistName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        return label
    }()
    
    let imageView: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(systemName: "photo")
        return image
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
       
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
}
