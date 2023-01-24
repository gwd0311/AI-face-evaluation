//
//  Language.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/06.
//

import Foundation

enum Language: String {
    case korean
}

class LanguageManager: ObservableObject {
    
    @Published var language: Language = .korean
    
    var mainDescription: String {
        switch language {
        case .korean:
            return "인공지능 AI가 당신의 얼굴이 어떤 스타일인지 분석합니다."
        }
    }
    
    var woman: String {
        switch language {
        case .korean:
            return "여성"
        }
    }
    
    var man: String {
        switch language {
        case .korean:
            return "남성"
        }
    }
    
    var mainBottomScript: String {
        switch language {
        case .korean:
            return "업로드한 사진은 분석에만 이용되며, 저장하지 않습니다."
        }
    }
    
    var resultsAnalysis: String {
        switch language {
        case .korean:
            return "결과 분석"
        }
    }
    
    var settingsTitle: String {
        switch language {
        case .korean:
            return "인공지능 얼굴분석이 뭔가요?"
        }
    }
    
    var settingsContent1: String {
        switch language {
        case .korean:
            return "인공지능 얼굴분석은 5,000장의 얼굴 사진 데이터를 5개의 분류로 나누어 훈련시킨 기계학습 모델이 도입된 어플리케이션 입니다."
        }
    }
    
    var settingsContent2: String {
        switch language {
        case .korean:
            return "모델을 학습시키는 과정에서 주관성이 들어갈 수 있기 때문에 결과는 부정확할 수 있습니다."
        }
    }
    
    var settingsContent3: String {
        switch language {
        case .korean:
            return "그럼에도 사진을 최대한 객관적으로 분류하기 위해 노력하였으니 많이 이용해주시면 감사하겠습니다."
        }
    }
    
    var screenshotError: String {
        switch language {
        case .korean:
            return "스크린샷을 저장하던중 오류가 발생하였습니다."
        }
    }
    
    var onlyOnePeopleShouldAppear: String {
        switch language {
        case .korean:
            return "사진에서 사람은 한명만 나와야 합니다."
        }
    }
    
    var shouldAppearFace: String {
        switch language {
        case .korean:
            return "눈,코,입이 모두 보이는 사람 사진이어야 합니다."
        }
    }
    
    var photoRecogError: String {
        switch language {
        case .korean:
            return "사진을 인식하는 데 실패하였습니다."
        }
    }
    
    var recogErrorTitle: String {
        switch language {
        case .korean:
            return "인식 실패"
        }
    }
    
    var plzAttachImage: String {
        switch language {
        case .korean:
            return "이미지를 첨부하고 시도해주세요."
        }
    }
    
    var resultAnalysisError: String {
        switch language {
        case .korean:
            return "결과 분석 실패"
        }
    }
    
    var languageSettings: String {
        switch language {
        case .korean:
            return "언어설정"
        }
    }
    
    var ai: String {
        switch language {
        case .korean:
            return "인공지능"
        }
    }
    
    var facetest: String {
        switch language {
        case .korean:
            return "얼굴분석"
        }
    }
    
    var tryAgainWithImage: String {
        switch language {
        case .korean:
            return "이미지를 넣고 시도하세요"
        }
    }
    
    var anotherImage: String {
        switch language {
        case .korean:
            return "다른 사진으로 재시도"
        }
    }
    
    var screenshotCompleted: String {
        switch language {
        case .korean:
            return "스크린샷이 저장되었습니다."
        }
    }
    
    func changeLanguage(language: Language) {
        self.language = language
    }
    
    func translateChartResult(message: String) -> String {
        switch message {
        case "잘생긴 부위":
            switch language {
            case .korean:
                return "잘생긴 부위"
            }
        case "예쁜 부위":
            switch language {
            case .korean:
                return "예쁜 부위"
            }
        case "귀여운 부위":
            switch language {
            case .korean:
                return "귀여운 부위"
            }
        case "지적인 부위":
            switch language {
            case .korean:
                return "지적인 부위"
            }
        case "섹시한 부위":
            switch language {
            case .korean:
                return "섹시한 부위"
            }
        case "듬직한 부위":
            switch language {
            case .korean:
                return "듬직한 부위"
            }
        default:
            return "error"
        }
        
    }
    
}

