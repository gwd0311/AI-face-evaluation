//
//  String+.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/04.
//

import Foundation
import SwiftUI

extension String {
    
    var toInteger: String {
        let value = (Double(self) ?? 0) * 100
        return String(format: "%.0f", value)
    }
    
    var toPercent: Double {
        (Double(self) ?? 100) / 100
    }
    
    var toChartLabel: String? {
        switch self {
        case "veryHansome":
            return "잘생긴 부위"
        case "veryPretty":
            return "예쁜 부위"
        case "hansome", "pretty":
            return "귀여운 부위"
        case "normal":
            return "지적인 부위"
        case "ugly":
            return "섹시한 부위"
        case "veryUgly":
            return "듬직한 부위"
        default:
            return nil
        }
    }
    
    var toTitleLabel: String? {
        switch self {
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
            return nil
        }
    }
    
    var toColor: Color? {
        switch self {
        case "veryHansome", "veryPretty":
            return Color(uiColor: UIColor(red: 0.271, green: 0.427, blue: 0.976, alpha: 1))
        case "hansome", "pretty":
            return Color(uiColor: UIColor(red: 0.171, green: 0.748, blue: 0.875, alpha: 1))
        case "normal":
            return Color(uiColor: UIColor(red: 0.252, green: 0.863, blue: 0.313, alpha: 1))
        case "ugly":
            return Color(uiColor: UIColor(red: 0.793, green: 0.271, blue: 0.976, alpha: 1))
        case "veryUgly":
            return Color(uiColor: UIColor(red: 0.917, green: 0.511, blue: 0.218, alpha: 1))
        default:
            return nil
        }
    }
    
}
