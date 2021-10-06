//
//  albumDetailResponse.swift
//  spotify
//
//  Created by Shashwat on 05/10/21.
//

import Foundation

struct albumDetailResponse : Codable{
    let album_type: String
    let artists: [artistModel]
    let available_markets : [String]
    let external_urls:[String:String]
    let id:String
    let images: [ImageModel]
    let label:String
    let tracks: trackResponse
}

struct trackResponse:Codable {
    let items: [AudioTrack]
}
