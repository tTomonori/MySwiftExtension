//
//  HandleCameraOrientation.swift
//  myExtensions
//
//  Created by tomonori takada on 2019/06/20.
//  Copyright © 2019 takatomo. All rights reserved.
//

import Foundation

open class HandleCameraOrientation{
    static public func fixSize(_ aSize:CGSize)->CGSize{
        let (x,y)=fix(aSize.width,aSize.height)
        return CGSize(width: x, height: y)
    }
    static public func fixVector(_ aVector:CGVector)->CGVector{
        let (x,y)=fix(aVector.dx, aVector.dy)
        return CGVector(dx: x, dy: y)
    }
    static public func fixRect(_ aRect:CGRect)->CGRect{
        let (x,y)=fix(aRect.width, aRect.height)
        if(x==aRect.width){
            return CGRect(x: aRect.minX, y: aRect.minY, width: x, height: y)
        }else{
            return CGRect(x: aRect.minY, y: aRect.minX, width: x, height: y)
        }
    }
    static public func fix(_ aX:CGFloat,_ aY:CGFloat)->(CGFloat,CGFloat){
        if(UIDevice.current.orientation.isPortrait){
            //縦向き
            if(aX<aY){
                return (aX,aY)
            }else{
                return (aY,aX)
            }
        }else{
            //横向き
            if(aX<aY){
                return (aY,aX)
            }else{
                return (aX,aY)
            }
        }
    }
}
