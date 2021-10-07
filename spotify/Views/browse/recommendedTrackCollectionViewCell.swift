//
//  recommendedTrackCollectionViewCell.swift
//  spotify
//
//  Created by Shashwat on 02/10/21.
//

import UIKit

class recommendedTrackCollectionViewCell: UICollectionViewCell {
    static let identifier = "recommendedPlaylist"
    private let trackArtwork:UIImageView = {
       let image = UIImageView()
        image.image = UIImage(systemName: "photo")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds  = true
        return image
    }()
    
    private let trackLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    private let artistName:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 13, weight: .light)
        return label
    }()
    
    private var likeButton:UIButton  = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .systemGreen
        return button
    }()
    
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        contentView.addSubview(trackLabel)
        likeButton.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        contentView.addSubview(artistName)
        contentView.addSubview(trackArtwork)
        contentView.addSubview(likeButton)
    //    contentView.backgroundColor = .systemBlue
     //   likeButton.backgroundColor = .black
    }
    
    @objc func didTap(){
        if likeButton.currentImage == UIImage(systemName: "heart.fill"){
            likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }else{
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        trackLabel.sizeToFit()
        let imageSize:CGFloat = CGFloat(contentView.frame.size.height)
        trackArtwork.frame = CGRect(x: 0, y: 0, width: imageSize, height: imageSize)
        trackLabel.frame = CGRect(x: imageSize+10,
                                  y: 0,
                                  width: contentView.frame.size.width - 150 ,
                                  height: 30)
        artistName.frame = CGRect(x: imageSize+10,
                                  y: trackArtwork.frame.midY,
                                  width: contentView.frame.size.width - 150 ,
                                  height: 30)
        likeButton.frame = CGRect(x: contentView.frame.maxX - 80, y: trackArtwork.frame.midY - 19, width: 35, height: 35)
     //   likeButton.backgroundColor = .white
    }
    
    override func prepareForReuse(){
        super.prepareForReuse()
        trackLabel.text = nil
        trackArtwork.image = nil
        artistName.text = nil
    }
    
    func configure(with viewModel: recommendedTrackViewModel){
        trackLabel.text = viewModel.name
        artistName.text = viewModel.artistName
        trackArtwork.sd_setImage(with: viewModel.artworkURL, completed: nil)
        print("enterig view model",viewModel)
    }
    
}
