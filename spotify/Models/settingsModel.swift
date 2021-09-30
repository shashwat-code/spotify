//
//  settingsModel.swift
//  spotify
//
//  Created by Shashwat on 30/09/21.
//

import Foundation

struct Section {
    var title:String
    var options: [Option]
}

struct Option {
    var title:String
    var handler: ()->Void
}
