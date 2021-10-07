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
      //  backgroundColor = .red
        addSubview(playlistName)
        addSubview(imageView)
        addSubview(desc)
        addSubview(playButton)
    }
    
    let desc: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15 , weight: .light)
        label.textColor = .secondaryLabel
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
    
    let playButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "play.fill",withConfiguration: UIImage.SymbolConfiguration(pointSize: 30, weight: .regular)), for: .normal)
        button.layer.cornerRadius = 30
        button.backgroundColor = .systemGreen
        
        button.tintColor = .black
        return button
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
       
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageSize = height/1.5
        imageView.frame = CGRect(x: (width-imageSize)/2,
                                 y: 20,
                                 width: imageSize,
                                 height: imageSize)
        
        playlistName.frame = CGRect(x: 10,
                                    y: bottom-70,
                                    width: width - 20,
                                    height: 20)

        desc.frame = CGRect(x: 10,
                            y: imageView.bottom - 50,
                            width: width - 20,
                            height: 44)
        playButton.frame = CGRect(x: width-80, y: height-80, width: 60, height: 60)

        
    }
    
    func configure(with viewModel: headerPlaylistViewModel){
        playlistName.text = viewModel.name ?? "-"
        desc.text = viewModel.desc ?? "-"
        imageView.sd_setImage(with: viewModel.artworkURL, completed: nil)
        
    }
    
}
