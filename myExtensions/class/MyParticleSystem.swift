//
//  MyParticleSystem.swift
//  myExtensions
//
//  Created by tomonori takada on 2019/05/17.
//  Copyright © 2019 takatomo. All rights reserved.
//

import Foundation
import SceneKit

open class MyParticleSystem{
    static public func load(_ fileName:String)->SCNNode{
        guard let tParticle=SCNParticleSystem(named: fileName, inDirectory: nil)else{
            print("パーティクル「"+fileName+"」のロードに失敗")
            return SCNNode()
        }
        let tNode=SCNNode()
        tNode.addParticleSystem(tParticle)
        return tNode
    }
}
