//
//  MyJson.swift
//  myExtensions
//
//  Created by tomonori takada on 2019/07/10.
//  Copyright © 2019 takatomo. All rights reserved.
//

import Foundation

open class MyJson{
    //json文字列にする
    static public func serialize(_ aData:Dictionary<String,Any>)->String{
        // DictionaryをJSONデータに変換
        let tJsonData = try! JSONSerialization.data(withJSONObject: aData)
        // JSONデータを文字列に変換
        let tJsonStr = String(bytes: tJsonData, encoding: .utf8)!
        
        return tJsonStr
    }
    //json文字列をdictionaryにする
    static public func deserialize(_ aStr:String)->Dictionary<String,Any>{
        // JSON文字列をData型に変換
        let tData:Data = aStr.data(using: String.Encoding.utf8)!
        // パースする
        let tJsonDic = try! JSONSerialization.jsonObject(with: tData) as! Dictionary<String, Any>
        
        return tJsonDic
    }
    ///NSNumberをFloatにする
    static public func nsNumberToFloat(_ aData:Dictionary<String,Any>)->Dictionary<String,Any>{
        return correct(aData) as! Dictionary<String,Any>
    }
    static private func correct(_ a:Any)->Any{
        //nsnumber整形
        if let tNumber = a as? NSNumber{
            return Float(truncating: tNumber)
        }
        //dictionry整形
        if let tDictionary = a as? Dictionary<String,Any>{
            var tDic=Dictionary<String,Any>()
            for (tKey,tValue) in tDictionary{
                tDic[tKey]=correct(tValue)
            }
            return tDic
        }
        //配列
        if let tArray = a as? [Any]{
            var tArr:[Any]=[]
            for n in tArray{
                tArr.append(correct(n))
            }
            return tArr
        }
        return a
    }
}
