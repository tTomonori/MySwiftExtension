//
//  cgPoint.swift
//  myExtensions
//
//  Created by tomonori takada on 2019/07/10.
//  Copyright © 2019 takatomo. All rights reserved.
//

import Foundation
import SpriteKit

public func +(l:CGPoint,r:CGPoint)->CGPoint{
    return CGPoint(x: l.x+r.x, y: l.y+r.y)
}
