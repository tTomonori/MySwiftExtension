//
//  cgRect.swift
//  myExtensions
//
//  Created by tomonori takada on 2019/07/24.
//  Copyright © 2019 takatomo. All rights reserved.
//

import Foundation

public extension CGRect{
    ///xとyを0にしたCGRectを返す
    var sizeRect:CGRect{
        get{return CGRect(x: 0, y: 0, width: width, height: height)}
    }
}
