//
//  Evaluation.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/03.
//

import Foundation
import UIKit

@MainActor
class Evaluation: ObservableObject {
    
    @Published var isWoman: Bool = false
    @Published var isClassificationEnd: Bool = false
    @Published var image: UIImage?
    @Published var results: [Analysis] = []
    
    func appendResults(analysis: Analysis) {
        results.append(analysis)
    }
    
    func initializeResults() {
        results = []
    }
    
    func initializeEnd() {
        isClassificationEnd = false
    }
    
    func initializeImage() {
        image = nil
    }
    
    func initializeAll() {
        results = []
        isClassificationEnd = false
        image = nil
    }
}
