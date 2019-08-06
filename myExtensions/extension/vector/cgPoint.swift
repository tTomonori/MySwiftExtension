//
//  cgPoint.swift
//  myExtensions
//
//  Created by tomonori takada on 2019/07/10.
//  Copyright © 2019 takatomo. All rights reserved.
//

import Foundation
import SpriteKit

public extension CGPoint{
    ///配列から初期化
    init(_ aVec:[Float]){
        self.init()
        x=CGFloat(aVec[0])
        y=CGFloat(aVec[1])
    }
}

public func +(l:CGPoint,r:CGPoint)->CGPoint{
    return CGPoint(x: l.x+r.x, y: l.y+r.y)
}
public func -(l:CGPoint,r:CGPoint)->CGPoint{
    return CGPoint(x: l.x-r.x, y: l.y-r.y)
}
public func *(l:CGPoint,r:CGPoint)->CGPoint{
    return CGPoint(x: l.x*r.x, y: l.y*r.y)
}
