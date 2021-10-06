//
//  newReleaseCollectionViewCell.swift
//  spotify
//
//  Created by Shashwat on 02/10/21.
//

import UIKit
import SDWebImage

class newReleaseCollectionViewCell: UICollectionViewCell {
    static let identifier = "newReleases"
    
    private let AlbumImageView:UIImageView = {
       let image = UIImageView()
        image.image = UIImage(systemName: "photo")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds  = true
        return image
    }()
    
    private let albumLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    private let numberOfTracks:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .thin)
        return label
    }()
    
    private let artistNameLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .light)
        return label
    }()
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemFill
        contentView.addSubview(albumLabel)
        contentView.addSubview(artistNameLabel)
        contentView.addSubview(numberOfTracks)
        contentView.addSubview(AlbumImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        albumLabel.sizeToFit()
        artistNameLabel.sizeToFit()
        numberOfTracks.sizeToFit()
        let imageSize:CGFloat = CGFloat(contentView.frame.size.height)
        AlbumImageView.frame = CGRect(x: 0, y: 0, width: imageSize, height: imageSize)
        numberOfTracks.frame = CGRect(x: AlbumImageView.frame.size.width+10,
                                      y: AlbumImageView.bottom - 30 ,
                                      width: contentView.frame.size.width - imageSize - 10,
                                      height: 30)
       // numberOfTracks.backgroundColor = .red
        albumLabel.frame = CGRect(x: AlbumImageView.frame.size.width + 10,
                                  y: 10,
                                  width: contentView.frame.size.width - imageSize - 10,
                                  height: 30)
//albumLabel.backgroundColor = .blue
        
        artistNameLabel.frame = CGRect(x: AlbumImageView.frame.size.width+10,
                                       y:  AlbumImageView.frame.minY + 50 ,
                                       width: contentView.frame.size.width - imageSize - 10,
                                       height: 40)
       // artistNameLabel.backgroundColor = .orange
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        albumLabel.text = nil
        artistNameLabel.text = nil
        numberOfTracks.text = nil
        AlbumImageView.image = nil
    }
    func configure(with viewModel: newReleasesCellViewModel){
        albumLabel.text = viewModel.name
        artistNameLabel.text = viewModel.artistName
        numberOfTracks.text = "Tracks: \(viewModel.numberOfTrack)"
        AlbumImageView.sd_setImage(with: viewModel.artWorkURL, completed: nil)
        
        
    }
}
