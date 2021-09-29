//
//  sizeExtensions.swift
//  spotify
//
//  Created by Shashwat on 29/09/21.
//

import Foundation
import UIKit

extension UIView{
    var width: CGFloat{
        return frame.size.width
    }
    var height: CGFloat{
        return frame.size.height
    }
    var left: CGFloat{
        return frame.origin.x
    }
    var right: CGFloat{
        return left + width
    }
    var top: CGFloat{
        return frame.origin.x
    }
    var bottom: CGFloat{
        return top + height
    }
}
