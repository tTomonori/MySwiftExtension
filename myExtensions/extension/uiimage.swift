//
//  uiimage.swift
//  myExtensions
//
//  Created by tomonori takada on 2019/05/15.
//  Copyright © 2019 takatomo. All rights reserved.
//

import Foundation

extension UIImage{
    ///「Privacy - Photo Library Additions Usage Description」が必要
    public func saveToAlbum(){
        UIImageWriteToSavedPhotosAlbum(self,nil,nil,nil)
    }
    ///base64エンコード
    public func toBase64()->String{
        let datas:Data = self.pngData()!
        let dataString = datas.base64EncodedString(options: [])
        return dataString
    }
    ///base64をデコード
    static public func fromBase64(_ aBase64:String)->UIImage?{
        let data:Data? =
            Data(base64Encoded: aBase64)
        if(data==nil){return nil}
        return UIImage(data: data!)

    }
}
