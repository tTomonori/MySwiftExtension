//
//  scnmatrix4.swift
//  myExtensions
//
//  Created by tomonori takada on 2019/05/15.
//  Copyright © 2019 takatomo. All rights reserved.
//

import Foundation
import SceneKit

public extension SCNMatrix4{
    var direction:SCNVector3{
        get{
            let mat = self
            let dir = SCNVector3(-1 * mat.m31, -1 * mat.m32 + 0.1, -1 * mat.m33)
            return dir
        }
    }
    var position:SCNVector3{
        get{
            let tNode=SCNNode()
            tNode.transform=self
            return tNode.position
        }
    }
    var rotation:SCNVector4{
        get{
            let tNode=SCNNode()
            tNode.transform=self
            return tNode.rotation
        }
    }
}
