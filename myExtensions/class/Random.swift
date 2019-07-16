//
//  Random.swift
//  myExtensions
//
//  Created by tomonori takada on 2019/06/05.
//  Copyright © 2019 takatomo. All rights reserved.
//

import Foundation

open class Random{
    ///0~1の値をランダムに返す
    static public func random()->Float{
        return Float(arc4random_uniform(100))/100.0
    }
    ///0~1の値をランダムに返す
    static public func randomCg()->CGFloat{
        return CGFloat(arc4random_uniform(100))/100.0
    }
    ///指定した範囲内の値をランダムに返す
    static public func random(_ min:Float,_ max:Float)->Float{
        return min+(max-min)*random()
    }
    ///指定した範囲内の値をランダムに返す
    static public func randomCg(_ min:CGFloat,_ max:CGFloat)->CGFloat{
        return min+(max-min)*randomCg()
    }
    
    static private var mCount:Int=0
    ///このメソッドが呼ばれた回数を返す(初回は1)
    static public func count()->Int{
        mCount = mCount+1
        return mCount
    }
    ///引数パーセントの確率でtrueを返す
    static public func dice(_ aPercent:Int)->Bool{
        return arc4random_uniform(100)<=aPercent
    }
}
