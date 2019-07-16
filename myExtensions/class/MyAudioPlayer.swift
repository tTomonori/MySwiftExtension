//
//  MyAudioPlayer.swift
//  myExtensions
//
//  Created by tomonori takada on 2019/05/21.
//  Copyright © 2019 takatomo. All rights reserved.
//

import Foundation
import AVFoundation

open class MyAudioPlayer:NSObject, AVAudioPlayerDelegate{
    static private var audio:AVAudioPlayer!
    static public func play(_ fileName:String,_ extensionName:String="mp3"){
        guard let path = Bundle.main.path(forResource: fileName, ofType: extensionName) else {
            print("音源ファイル("+fileName+"."+extensionName+")が見つかりません")
            return
        }
        
        do {
            // AVAudioPlayerのインスタンス化
            audio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            
            // AVAudioPlayerのデリゲートをセット
//            audio.delegate = (self as! AVAudioPlayerDelegate)
            
            // 音声の再生
            audio.prepareToPlay()
            audio.play()
        } catch {
            print("AVAudioPlayerインスタンス化失敗")
            return
        }
    }
}
