//
//  FaceDetector.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/04.
//

import Foundation
import CoreML
import Vision
import UIKit

class FaceDetector {
    
    private var completion: ([VNFaceObservation]) -> Void = { _ in }
    
    private lazy var requests: [VNDetectFaceRectanglesRequest] = {
        let request = VNDetectFaceRectanglesRequest { [weak self] req, err in
            // completionHandler로  (VNRequest, Error?) -> Void 타입을 갖음
              if let err = err {
                  print("Failed to detect faces: ", err)
                  return
              }
              
              // results에 [Any]? 타입으로 저장되어 있어서 다운 캐스팅 해준다
              // 얼굴 1개당 VNFaceObservation 객체 1개이므로 [VNFaceObservation] 통째로 캐스팅해버리기!
              if let faces = req.results as? [VNFaceObservation] {
                  self?.completion(faces)
              } else {
                  print("얼굴이 없습니다.")
                  self?.completion([])
              }
        }
        // Error Domain=com.apple.vis Code=1 "request VNDetectFaceRectanglesRequest was cancelled"
        // Error Domain=com.apple.vis Code=9 "Could not create inference context"
        // M1 시뮬레이터에서 위와 같은 에러 뜰 경우 해결법
        request.usesCPUOnly = true
        return [request]
    }()
    
    func detect(_ image: UIImage, completion: @escaping ([VNFaceObservation]) -> Void) {
        
        self.completion = completion
        
        DispatchQueue.global().async {
            
            guard let cgImage = image.cgImage else {
                return
            }
            
            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            
            do {
                try handler.perform(self.requests)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
