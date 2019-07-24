//
//  cgSize.swift
//  myExtensions
//
//  Created by tomonori takada on 2019/06/25.
//  Copyright © 2019 takatomo. All rights reserved.
//

import Foundation

public extension CGSize{
    ///CGPointに変換
    func toPoint()->CGPoint{
        return CGPoint(x: width, y: height)
    }
    ///配列から初期化
    init(_ aVec:[Float]){
        self.init()
        width=CGFloat(aVec[0])
        height=CGFloat(aVec[1])
    }
}

public func /(l:CGSize,r:Float)->CGSize{
    return CGSize(width: l.width/CGFloat(r), height: l.height/CGFloat(r))
}
public func /(l:CGSize,r:CGFloat)->CGSize{
    return CGSize(width: l.width/r, height: l.height/r)
}
public func /(l:CGSize,r:Double)->CGSize{
    return CGSize(width: l.width/CGFloat(r), height: l.height/CGFloat(r))
}
public func /(l:CGSize,r:Int)->CGSize{
    return CGSize(width: l.width/CGFloat(r), height: l.height/CGFloat(r))
}
public func *(l:CGSize,r:Float)->CGSize{
    return CGSize(width: l.width*CGFloat(r), height: l.height*CGFloat(r))
}
public func *(l:CGSize,r:CGFloat)->CGSize{
    return CGSize(width: l.width*CGFloat(r), height: l.height*CGFloat(r))
}
public func *(l:CGSize,r:Double)->CGSize{
    return CGSize(width: l.width*CGFloat(r), height: l.height*CGFloat(r))
}
public func *(l:CGSize,r:Int)->CGSize{
    return CGSize(width: l.width*CGFloat(r), height: l.height*CGFloat(r))
}
