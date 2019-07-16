//
//  arscnview.swift
//  myExtensions
//
//  Created by tomonori takada on 2019/05/15.
//  Copyright © 2019 takatomo. All rights reserved.
//

import Foundation
import ARKit

extension ARSCNView{
    ///カメラの映像をキャプチャ
    public func capture()->UIImage?{
        let sceneView=self
        // カメラから現在のフレームの取得
        guard let frame = sceneView.session.currentFrame else {return nil}
        // フレーム自体はPixelBufferとして取りだされる
        let pixelBuffer: CVPixelBuffer = frame.capturedImage
        
        // PixelBufferからUIImageへは直接変換するのは難しいため、CIImageに一度変換する
        var cmage: CIImage = CIImage(cvPixelBuffer: pixelBuffer)
        let context:CIContext = CIContext.init(options: nil)
        
        //カメラの向きに応じて回転
        if(UIDevice.current.orientation.isPortrait){
            let orientation :CGImagePropertyOrientation = CGImagePropertyOrientation.right
            cmage = cmage.oriented(orientation)
        }
        
        // CIImageからCGImageとして画像を取り出し、UIImageで読み込み
        let cgImage:CGImage = context.createCGImage(cmage, from: cmage.extent)!
        let image = UIImage(cgImage: cgImage)
        
        return image
    }
    //シーン映像をキャプチャ
    public func captureScene() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(UIScreen.main.bounds.size, false, 0);
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    ///カメラの視野角
    public var cameraViewingAngle:CGVector{
        get{
            //y方向視野角
            let projection = session.currentFrame!.camera.projectionMatrix
            let yScale = projection[1,1]
            let yFov = 2 * atan(1/yScale) // in radians
            let yFovDegrees = yFov * 180/Float.pi
            //x方向視野角
            let xFov = yFov * Float(self.session.currentFrame!.camera.imageResolution.width / self.session.currentFrame!.camera.imageResolution.height)
            let xFovDegrees = xFov * 180/Float.pi
            //画面の向きに合わせてから返す
            return HandleCameraOrientation.fixVector(CGVector(dx: CGFloat(xFovDegrees), dy: CGFloat(yFovDegrees)))
        }
    }
    ///ビューの視野角
    public var viewViewingAngle:CGVector{
        get{
            let tCA=self.cameraViewingAngle
            let tSceneViewSize=self.bounds
            var tCameraViewSize=CGRect(x: 0, y: 0,
                                       width: CVPixelBufferGetWidth(self.session.currentFrame!.capturedImage),
                                       height: CVPixelBufferGetHeight(self.session.currentFrame!.capturedImage))
            tCameraViewSize=HandleCameraOrientation.fixRect(tCameraViewSize)
            if(tSceneViewSize.width/tCameraViewSize.width < tSceneViewSize.height/tCameraViewSize.height){
                return CGVector(dx: tCA.dy*(tSceneViewSize.width/tSceneViewSize.height),
                                dy: tCA.dy)
            }else{
                return CGVector(dx: tCA.dx,
                                dy: tCA.dx*(tSceneViewSize.height/tSceneViewSize.width))
            }
//            return CGVector(dx: CGFloat(tCA.dx*tSceneViewSize.width/tCameraViewSize.width),
//                            dy: CGFloat(tCA.dy*tSceneViewSize.height/tCameraViewSize.height))
        }
    }
    ///指定した座標(World座標)がviewのどの位置(左下-1~右上1)に映っているか(映っていないならnil)
    public func convert3dPositionToViewPosition(_ aPosition:SCNVector3)->CGPoint?{
        //カメラから指定座標への相対座標
        var tPosition = pointOfView!.convertPosition(aPosition, from: nil)
        //カメラの背後にあるなら映っていない
        if(tPosition.z>=0){return nil}
        //view端のベクトル
        let tViewingAngle=self.viewViewingAngle
        var tEndVector=SCNVector3(0,0,-2)
        tEndVector.rotateX(aDeg: Float(tViewingAngle.dy/2))
        tEndVector.rotateY(aDeg: Float(tViewingAngle.dx/2))
        tEndVector=SCNVector3(CGFloat(tEndVector.x / -tEndVector.z),
                              CGFloat(tEndVector.y / -tEndVector.z),
                              CGFloat(tEndVector.z / -tEndVector.z))
        //z方向を-1にする
        tPosition=SCNVector3(CGFloat(tPosition.x / -tPosition.z),
                             CGFloat(tPosition.y / -tPosition.z),
                             CGFloat(tPosition.z / -tPosition.z))
        //viewの範囲外か判定
        if(tPosition.x < -tEndVector.x || tEndVector.x < tPosition.x ||
            tPosition.y < -tEndVector.y || tEndVector.y < tPosition.y){
            return nil
        }
        //指定座標が映っている位置
        let tFPoint=CGPoint(x: CGFloat(tPosition.x/tEndVector.x),
                            y: CGFloat(tPosition.y/tEndVector.y))
        
        return tFPoint
    }
}
