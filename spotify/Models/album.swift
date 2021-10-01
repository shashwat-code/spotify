//
//  album.swift
//  spotify
//
//  Created by Shashwat on 01/10/21.
//

import Foundation

struct album:Codable{
    let album_type:String
    let name:String
    let available_markets: [String]
    let artists:[artistModel]
    let images: [ImageModel]
    let release_date:String
    let total_tracks:Int
    
}
