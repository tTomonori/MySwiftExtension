//
//  string.swift
//  myExtensions
//
//  Created by tomonori takada on 2019/07/11.
//  Copyright © 2019 takatomo. All rights reserved.
//

import Foundation

public extension String{
    ///from文字目からto文字目までを切り取る(先頭=0,末尾=-1)
    func substring(from:Int,to:Int)->String{
        let correctedFrom=(from>=0) ? from :self.count+from
        let correctedTo=(to>=0) ? to : self.count+to
        let fromIndex = self.index(self.startIndex, offsetBy: correctedFrom)
        let toIndex = self.index(self.startIndex, offsetBy: correctedTo)
        let text = self[fromIndex...toIndex]
        return String(text)
    }
    ///form文字目からoffset文字を切り取る(先頭=0,末尾=-1)(offsetが負の場合は、先頭方向に向かって文字数をカウント)
    func substring(from:Int,offset:Int)->String{
        if(offset==0){return ""}
        let correctedFrom=(from>=0) ? from :self.count+from
        let fromIndex = self.index(self.startIndex, offsetBy: correctedFrom)
        if(offset>0){
            let toIndex = self.index(fromIndex, offsetBy: offset-1)
            let text = self[fromIndex...toIndex]
            return text.base
        }else{
            let toIndex = self.index(fromIndex, offsetBy: offset+1)
            let text = self[toIndex...fromIndex]
            return String(text)
        }
    }
}
