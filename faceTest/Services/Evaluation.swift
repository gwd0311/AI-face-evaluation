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
    
    @Published var isWoman: Bool = true
    @Published var isClassificationEnd: Bool = false
    @Published var isLoading: Bool = false
    @Published var image: UIImage?
    @Published var screenshotImage: UIImage?
    @Published var results: [Analysis] = []
    
    func updateScreenshotImage(image: UIImage) {
        screenshotImage = image
    }
    
    func sortResults() {
        self.results = results.sorted { $0.ratio.toPercent > $1.ratio.toPercent }
    }
    
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
        screenshotImage = nil
    }
}
