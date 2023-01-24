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
    
    var languageManager = LanguageManager()
    var interstitalAd = InterstitialAd()
    
    var resultMessage: String {
        switch languageManager.language {
        case .korean:
            switch results.first?.label {
            case "veryHansome":
                return "잘생긴 스타일"
            case "veryPretty":
                return "예쁜 스타일"
            case "hansome", "pretty":
                return "귀여운 스타일"
            case "normal":
                return "지적인 스타일"
            case "ugly":
                return "섹시한 스타일"
            case "veryUgly":
                return "듬직한 스타일"
            default:
                return "레이블 오류"
            }
        }
    }
    
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
