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

//CGFloat Float
public func +(l:CGFloat,r:Float)->CGFloat{
    return l+CGFloat(r)
}
public func +(l:Float,r:CGFloat)->Float{
    return l+Float(r)
}
public func *(l:CGFloat,r:Float)->CGFloat{
    return l*CGFloat(r)
}
public func *(l:Float,r:CGFloat)->Float{
    return l*Float(r)
}

//CGFloat Int
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

//CGFloat Double
public func *(l:CGFloat,r:Double)->CGFloat{
    return l*CGFloat(r)
}

//Float Int
public func *(l:Int,r:Float)->Float{
    return Float(l)+r
}
public func *(l:Float,r:Int)->Float{
    return l+Float(r)
}

//Double Int
public func /(l:Double,r:Int)->Double{
    return l/Double(r)
}
public func *(l:Double,r:Int)->Double{
    return l*Double(r)
}
