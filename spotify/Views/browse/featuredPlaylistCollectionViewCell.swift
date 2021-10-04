//
//  featuredPlaylistCollectionViewCell.swift
//  spotify
//
//  Created by Shashwat on 02/10/21.
//

import UIKit

class featuredPlaylistCollectionViewCell: UICollectionViewCell {
    static let identifier = "featuredPlaylist"
    
    private let playlistImageView:UIImageView = {
       let image = UIImageView()
        image.image = UIImage(systemName: "photo")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds  = true
        return image
    }()
    
    
    private let playlistLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
//    private let numberOfTracks:UILabel = {
//        let label = UILabel()
//        label.numberOfLines = 0
//        label.font = .systemFont(ofSize: 18, weight: .thin)
//        return label
//    }()
    
    private let creatorNameLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .light)
        return label
    }()
    
    override init(frame:CGRect) {
        super.init(frame: frame)
     //   contentView.backgroundColor = .secondarySystemFill
        contentView.addSubview(playlistLabel)
//        contentView.addSubview(creatorNameLabel)
      //  contentView.addSubview(numberOfTracks)
        contentView.addSubview(playlistImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playlistLabel.sizeToFit()
        creatorNameLabel.sizeToFit()
  //      numberOfTracks.sizeToFit()
        let imageSize:CGFloat = CGFloat(contentView.frame.size.height - 30)
        playlistImageView.frame = CGRect(x: 15, y: 0, width: imageSize, height: imageSize)

        playlistLabel.frame = CGRect(x: 15,
                                     y: contentView.frame.maxY - 30,
                                  width: contentView.frame.size.width - 30 ,
                                  height: 30)
  //     playlistLabel.backgroundColor = .blue

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        playlistLabel.text = nil
        creatorNameLabel.text = nil
 //       numberOfTracks.text = nil
        playlistImageView.image = nil
    }
    func configure(with viewModel: featuredPlaylistCellViewModel){
        playlistLabel.text = viewModel.name
        creatorNameLabel.text = viewModel.creatorName
//        numberOfTracks.text = "Tracks: \(viewModel.numberOfTrack)"
        playlistImageView.sd_setImage(with: viewModel.artwork, completed: nil)
        
        
    }
    
}
