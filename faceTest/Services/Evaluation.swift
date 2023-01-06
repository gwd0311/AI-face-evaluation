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
    
    var resultMessage: String {
        switch languageManager.language {
        case .korean:
            switch results.first?.label {
            case "veryHansome", "veryPretty":
                return "씹상타취"
            case "hansome", "pretty":
                return "상타취"
            case "normal":
                return "평타취"
            case "ugly":
                return "하타취"
            case "veryUgly":
                return "씹하타취"
            default:
                return "레이블 오류"
            }
        case .english:
            switch results.first?.label {
            case "veryHansome", "veryPretty":
                return "so cool"
            case "hansome", "pretty":
                return "cool"
            case "normal":
                return "normal"
            case "ugly":
                return "not good"
            case "veryUgly":
                return "bad"
            default:
                return "Label Error"
            }
        case .japanese:
            switch results.first?.label {
            case "veryHansome", "veryPretty":
                return "とても素敵"
            case "hansome", "pretty":
                return "素敵"
            case "normal":
                return "普通"
            case "ugly":
                return "醜い"
            case "veryUgly":
                return "とても醜い"
            default:
                return "ラベルエラー"
            }
        case .chinese:
            switch results.first?.label {
            case "veryHansome", "veryPretty":
                return "完美的人"
            case "hansome", "pretty":
                return "一个很好的人"
            case "normal":
                return "一个普通人"
            case "ugly":
                return "不好"
            case "veryUgly":
                return "丑陋的人"
            default:
                return "标签错误"
            }
        case .vietnamese:
            switch results.first?.label {
            case "veryHansome", "veryPretty":
                return "một người rất tốt"
            case "hansome", "pretty":
                return "một người tuyệt vời"
            case "normal":
                return "một người bình thường"
            case "ugly":
                return "xấu xí"
            case "veryUgly":
                return "người rất xấu xí"
            default:
                return "lỗi nhãn"
            }
        case .Indonesian:
            switch results.first?.label {
            case "veryHansome", "veryPretty":
                return "orang yang sangat baik"
            case "hansome", "pretty":
                return "orang baik"
            case "normal":
                return "membosankan"
            case "ugly":
                return "orang jelek"
            case "veryUgly":
                return "orang yang sangat jelek"
            default:
                return "kesalahan label"
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
