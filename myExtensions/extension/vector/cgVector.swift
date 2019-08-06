//
//  CGVector.swift
//  myExtensions
//
//  Created by tomonori takada on 2019/06/05.
//  Copyright © 2019 takatomo. All rights reserved.
//

import Foundation

public extension CGVector{
    ///向きがランダムなベクトルを生成
    static func random(_ length:CGFloat)->CGVector{
        let x:CGFloat=(CGFloat(arc4random()%200)-100)/100.0
        let y:CGFloat=(CGFloat(arc4random()%200)-100)/100.0
        var v=CGVector(dx: x, dy: y)
        v.length=length
        return v
    }
    ///大きさ
    var length:CGFloat{
        get{return sqrt(dx*dx+dy*dy)}
        set(a){
            self.normalize()
            self.dx=a*self.dx
            self.dy=a*self.dy
        }
    }
    ///角度
    var angle:CGFloat{
        get{return atan(dx/dy)*180/CGFloat.pi}
    }
    ///角度
    var radian:CGFloat{
        get{return atan2(dx,dy)}
    }
    ///回転する
    mutating func rotate(_ aDeg:CGFloat){
        let tAngle=CGFloat.pi*aDeg/180
        let tX=self.dx
        let tY=self.dy
        self.dx=tX*cos(tAngle)-tY*sin(tAngle)
        self.dy=tX*sin(tAngle)+tY*cos(tAngle)
    }
    ///回転する
    mutating func rotate(aRad:CGFloat){
        let tAngle=aRad
        let tX=self.dx
        let tY=self.dy
        self.dx=tX*cos(tAngle)-tY*sin(tAngle)
        self.dy=tX*sin(tAngle)+tY*cos(tAngle)
    }
    ///単位ベクトルにする
    mutating func normalize(){
        let tLength=self.length
        self.dx=self.dx/tLength
        self.dy=self.dy/tLength
    }
    ///単位ベクトルを返す
    var unit:CGVector{
        get{
            let tLength=self.length
            return CGVector(dx: self.dx/tLength, dy: self.dy/tLength)
        }
    }
    //CGPointに変換
    func toPoint()->CGPoint{
        return CGPoint(x: dx, y: dy)
    }
    //CGSizeに変換
    func toSize()->CGSize{
        return CGSize(width: dx, height: dy)
    }
}

public func *(l:Float,r:CGVector)->CGVector{
    return CGVector(dx: CGFloat(l)*r.dx, dy: CGFloat(l)*r.dy)
}
public func *(l:CGFloat,r:CGVector)->CGVector{
    return CGVector(dx: l*r.dx, dy: l*r.dy)
}
public func *(l:Double,r:CGVector)->CGVector{
    return CGVector(dx: CGFloat(l)*r.dx, dy: CGFloat(l)*r.dy)
}
