//
//  playlist.swift
//  spotify
//
//  Created by Shashwat on 01/10/21.
//

import Foundation


struct playlist:Codable {
        let description:String
        let external_urls:[String:String]
        let id:String
        let images: [ImageModel]
        let name:String
        let owner:user
    
}
