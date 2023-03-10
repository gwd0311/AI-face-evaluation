//
//  VisionClassifier.swift
//  fruit-classification-starter
//
//  Created by Mohammad Azam on 2/16/20.
//  Copyright © 2020 Mohammad Azam. All rights reserved.
//

import Foundation
import CoreML
import Vision
import UIKit


class VisionClassifier {
    
    private let model: VNCoreMLModel
    private var completion: ([VNClassificationObservation]) -> Void = { _ in }
    
    private lazy var requests: [VNCoreMLRequest] = {
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            
            guard let results = request.results as? [VNClassificationObservation] else {
                print("Vision request had no results.")
                return
            }
            
            if !results.isEmpty {
                self.completion(results)
            }
            
        }
        
        request.usesCPUOnly = true
        request.imageCropAndScaleOption = .centerCrop
        
        return [request]
        
    }()
    
    init?(mlModel: MLModel) {
        if let model = try? VNCoreMLModel(for: mlModel) {
            self.model = model
            print("model: \(self.model)")
        } else {
            return nil
        }
    }
    
    func classify(_ image: UIImage, completion: @escaping ([VNClassificationObservation]) -> Void) {
        
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
