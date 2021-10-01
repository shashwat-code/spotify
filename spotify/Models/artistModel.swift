//
//  artistModel.swift
//  spotify
//
//  Created by Shashwat on 01/10/21.
//

import Foundation

struct artistModel:Codable {
    let name:String
    let type:String
    let id:String
    let external_urls: [String:String]
}
