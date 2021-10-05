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
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    override init(frame:CGRect) {
        super.init(frame: frame)
 //       contentView.backgroundColor = .secondarySystemFill
        contentView.addSubview(trackLabel)
//        contentView.addSubview(creatorNameLabel)
      //  contentView.addSubview(numberOfTracks)
        contentView.addSubview(trackArtwork)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        trackLabel.sizeToFit()

        let imageSize:CGFloat = CGFloat(contentView.frame.size.height - 30)
        trackArtwork.frame = CGRect(x: 15, y: 0, width: imageSize, height: imageSize)
        trackArtwork.layer.cornerRadius = imageSize/2
        trackLabel.frame = CGRect(x: 15,
                                     y: contentView.frame.maxY - 30,
                                  width: contentView.frame.size.width - 30 ,
                                  height: 30)
 //       trackLabel.backgroundColor = .blue

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        trackLabel.text = nil
        trackArtwork.image = nil
    }
    func configure(with viewModel: recommendedCellViewModel){
        trackLabel.text = viewModel.name
        trackArtwork.sd_setImage(with: viewModel.artworkURL, completed: nil)
        
        
    }
}
