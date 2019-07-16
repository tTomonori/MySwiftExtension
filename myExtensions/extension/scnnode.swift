//
//  scnnode.swift
//  myExtensions
//
//  Created by tomonori takada on 2019/05/15.
//  Copyright © 2019 takatomo. All rights reserved.
//

import Foundation
import SceneKit

extension SCNNode{
    ///現在の位置を維持したまま親ノードのみを変更
    public func changeParent(_ aNode:SCNNode){
        if(self.parent==nil){//親ノードなし
            aNode.addChildNode(self)
            return;
        }
        //親ノードあり
        let tParent=self.parent!
        if(tParent==aNode){return}
        self.removeFromParentNode()
        self.transform=tParent.convertTransform(self.transform, to: aNode)
        aNode.addChildNode(self)
    }
    ///子ノード全消去
    public func removeAllChildren(){
        for tChild in childNodes{
            tChild.removeFromParentNode()
        }
    }
    ///このノードのローカル座標・回転を、指定したノードから見たときの値に変換する
    public func convertPosture(_ aPosition:SCNVector3,_ aRotation:SCNVector4,_ aFrom:SCNNode?)->(SCNVector3,SCNVector4){
        let tNode=SCNNode()
        tNode.position=aPosition
        tNode.rotation=aRotation
        self.addChildNode(tNode)
        tNode.transform=self.convertTransform(tNode.transform, to: aFrom)
        let tPosition=tNode.position
        let tRotation=tNode.rotation
        tNode.removeFromParentNode()
        return (tPosition,tRotation)
    }
}
