//
//  scnvector4.swift
//  myExtensions
//
//  Created by tomonori takada on 2019/07/10.
//  Copyright © 2019 takatomo. All rights reserved.
//

import Foundation
import SceneKit

public extension SCNVector4{
    ///配列から初期化
    init(_ aVec:[Float]){
        self.init()
        x=aVec[0]
        y=aVec[1]
        z=aVec[2]
        w=aVec[3]
    }
}
