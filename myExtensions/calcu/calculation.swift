//
//  calculation.swift
//  myExtensions
//
//  Created by tomonori takada on 2019/05/10.
//  Copyright © 2019 takatomo. All rights reserved.
//

import Foundation
import SceneKit



public func ^(l:Float,r:Int)->Float{
    var ans:Float=1
    for _ in 0..<r{
        ans *= l
    }
    return ans
}

public func -(l:CGFloat,r:Int)->CGFloat{
    return l-CGFloat(r)
}
public func -(l:Int,r:CGFloat)->CGFloat{
    return CGFloat(l)-r
}
public func +(l:CGFloat,r:Int)->CGFloat{
    return l+CGFloat(r)
}
public func +(l:Int,r:CGFloat)->CGFloat{
    return CGFloat(l)+r
}
