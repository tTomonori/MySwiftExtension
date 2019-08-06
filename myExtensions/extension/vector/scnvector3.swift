//
//  scnvector3.swift
//  myExtensions
//
//  Created by tomonori takada on 2019/05/14.
//  Copyright © 2019 takatomo. All rights reserved.
//

import Foundation
import SceneKit

public extension SCNVector3{
    //ゼロベクトル
    static var zeros:SCNVector3{get{return SCNVector3(0,0,0)}}
    ///配列から初期化
    init(_ aVec:[Float]){
        self.init()
        x=aVec[0]
        y=aVec[1]
        z=aVec[2]
    }
    ///向きがランダムなベクトル生成
    init(length:Float){
        self.init()
        x=(Float(arc4random()%200)-100)/100.0
        y=(Float(arc4random()%200)-100)/100.0
        z=(Float(arc4random()%200)-100)/100.0
        self.length=length
    }
    ///大きさ
    var length:Float{
        get{return sqrt(x*x+y*y+z*z)}
        set(a){
            self.normalize()
            self.x=a*self.x
            self.y=a*self.y
            self.z=a*self.z
        }
    }
    ///単位ベクトルにする
    mutating func normalize(){
        let tLength=self.length
        self.x=self.x/tLength
        self.y=self.y/tLength
        self.z=self.z/tLength
    }
    ///単位ベクトルを返す
    var unit:SCNVector3{
        get{
            let tLength=length
            return SCNVector3(x/tLength, y/tLength, z/tLength)
        }
    }
    ///X軸回転
    mutating func rotateX(aDeg:Float){
        let tAngle=Float.pi*aDeg/180
        let tX = -self.z
        let tY=self.y
        self.z=tX*cos(tAngle)-tY*sin(tAngle)
        self.y=tX*sin(tAngle)+tY*cos(tAngle)
        self.z = -self.z
    }
    ///Y軸回転
    mutating func rotateY(aDeg:Float){
        let tAngle=Float.pi*aDeg/180
        let tX=self.x
        let tY = self.z
        self.x=tX*cos(tAngle)-tY*sin(tAngle)
        self.z=tX*sin(tAngle)+tY*cos(tAngle)
    }
    ///Z軸回転
    mutating func rotateZ(aDeg:Float){
        let tAngle=Float.pi*aDeg/180
        let tX=self.x
        let tY=self.y
        self.x=tX*cos(tAngle)-tY*sin(tAngle)
        self.y=tX*sin(tAngle)+tY*cos(tAngle)
    }
    ///引数の座標までの距離
    func distance(_ aVec:SCNVector3)->Float{
        return sqrt((x-aVec.x)^2+(y-aVec.y)^2+(z-aVec.z)^2)
    }
    ///z軸を削る
    func to2D()->CGVector{
        return CGVector(dx: CGFloat(self.x), dy: CGFloat(self.y))
    }
}


public func +(l:SCNVector3,r:SCNVector3)->SCNVector3{
    return SCNVector3(l.x+r.x, l.y+r.y, l.z+r.z)
}
public func -(l:SCNVector3,r:SCNVector3)->SCNVector3{
    return SCNVector3(l.x-r.x, l.y-r.y, l.z-r.z)
}
public func /(l:SCNVector3,r:Float)->SCNVector3{
    return SCNVector3(l.x/r,l.y/r,l.z/r)
}

public func *(l:Float,r:SCNVector3)->SCNVector3{
    return SCNVector3(l*r.x, l*r.y, l*r.z)
}
