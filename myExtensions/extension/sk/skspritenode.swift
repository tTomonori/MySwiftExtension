//
//  skspritenode.swift
//  myExtensions
//
//  Created by tomonori takada on 2019/07/26.
//  Copyright © 2019 takatomo. All rights reserved.
//

import Foundation
import SpriteKit

public extension SKSpriteNode{
    ///指定したサイズに合わせる(負の数を設定した場合は、もう一方の拡大縮小率に合わせる)
    func setSize(_ aWidth:CGFloat,_ aHeight:CGFloat){
        if(aWidth<0&&aHeight<0){return}
        let tScaleX=aWidth/self.texture!.size().width
        let tScaleY=aHeight/self.texture!.size().height
        
        if(aWidth<0){
            self.xScale=tScaleY
        }else{
            self.xScale=tScaleX
        }
        if(aHeight<0){
            self.yScale=tScaleX
        }else{
            self.yScale=tScaleY
        }
    }
}
