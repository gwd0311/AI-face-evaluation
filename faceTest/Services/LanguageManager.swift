//
//  Language.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/06.
//

import Foundation

enum Language: String {
    case korean, english, japanese, chinese, vietnamese, Indonesian
}

class LanguageManager: ObservableObject {
    
    @Published var language: Language = .korean
    
    var mainDescription: String {
        switch language {
        case .korean:
            return "인공지능 AI가 당신의 얼굴이 몇타취인지 분석합니다."
        case .english:
            return "AI analyzes and evaluates your face."
        case .japanese:
            return "人工知能AIがあなたの顔を分析して評価します。"
        case .chinese:
            return "人工智能AI对你的脸进行分析评价。"
        case .vietnamese:
            return "AI trí tuệ nhân tạo phân tích và đánh giá khuôn mặt của bạn."
        case .Indonesian:
            return "AI menganalisis dan mengevaluasi wajah Anda."
        }
    }
    
    var woman: String {
        switch language {
        case .korean:
            return "여성"
        case .english:
            return "Woman"
        case .japanese:
            return "女性"
        case .chinese:
            return "女性"
        case .vietnamese:
            return "phụ nữ"
        case .Indonesian:
            return "wanita"
        }
    }
    
    var man: String {
        switch language {
        case .korean:
            return "남성"
        case .english:
            return "Man"
        case .japanese:
            return "男性"
        case .chinese:
            return "男性"
        case .vietnamese:
            return "nam giới"
        case .Indonesian:
            return "laki"
        }
    }
    
    var mainBottomScript: String {
        switch language {
        case .korean:
            return "업로드한 사진은 분석에만 이용되며, 저장하지 않습니다."
        case .english:
            return "Uploaded pictures are only used for analysis and do not save."
        case .japanese:
            return "アップロードした写真は分析にのみ利用され、保存されません。"
        case .chinese:
            return "上传的照片只用于分析，不保存。"
        case .vietnamese:
            return "Ảnh đã tải lên chỉ được sử dụng trong phân tích và không được lưu."
        case .Indonesian:
            return "Foto yang diunggah hanya digunakan untuk analisis, tapi tidak disimpan."
        }
    }
    
    var resultsAnalysis: String {
        switch language {
        case .korean:
            return "결과 분석"
        case .english:
            return "Analysis of results"
        case .japanese:
            return "結果分析"
        case .chinese:
            return "结果分析"
        case .vietnamese:
            return "phân tích kết quả"
        case .Indonesian:
            return "analisis"
        }
    }
    
    var settingsTitle: String {
        switch language {
        case .korean:
            return "인공지능 얼굴평가가 뭔가요?"
        case .english:
            return "What is AI face evaluation?"
        case .japanese:
            return "人工知能の顔評価って何ですか？"
        case .chinese:
            return "人工智能的面部评价是什么？"
        case .vietnamese:
            return "Đánh giá khuôn mặt trí tuệ nhân tạo là gì vậy?"
        case .Indonesian:
            return "Apa itu AI evaluasi wajah?"
        }
    }
    
    var settingsContent1: String {
        switch language {
        case .korean:
            return "인공지능 얼굴평가는 5,000장의 얼굴 사진 데이터를 5개의 분류로 나누어 훈련시킨 기계학습 모델이 도입된 어플리케이션 입니다."
        case .english:
            return "AI face evaluation is an application that introduces a machine learning model that trains 5,000 face photo data into five categories."
        case .japanese:
            return "人工知能顔評価は5000枚の顔写真データを5つの分類に分けて訓練させた機械学習モデルが導入されたアプリケーションです。"
        case .chinese:
            return "人工智能脸部评价是将5000张脸部照片数据分为5个分类进行训练的引进机器学习模式的应用程序。"
        case .vietnamese:
            return "Trí tuệ nhân tạo đánh giá khuôn mặt là một ứng dụng được áp dụng cho mô hình học máy được đào tạo bằng cách chia 5.000 bức ảnh khuôn mặt thành 5 loại."
        case .Indonesian:
            return "Penilaian Wajah Kecerdasan Buatan merupakan aplikasi yang memperkenalkan model pembelajaran mesin yang melatih 5.000 data foto wajah menjadi lima kategori."
        }
    }
    
    var settingsContent2: String {
        switch language {
        case .korean:
            return "모델을 학습시키는 과정에서 주관성이 들어갈 수 있기 때문에 결과는 부정확할 수 있습니다."
        case .english:
            return "Results may be inaccurate because subjectivity may be involved in learning the model."
        case .japanese:
            return "モデルを学習させる過程で主観性が入る可能性があるため、結果は不正確になる可能性があります。"
        case .chinese:
            return "结果可能是不准确的，因为在学习模型的过程中可能会引入主观性。"
        case .vietnamese:
            return "Kết quả có thể không chính xác vì trong quá trình học mô hình có thể đi vào tính chủ quan."
        case .Indonesian:
            return "Hasilnya mungkin tidak akurat karena subjektivitas dapat dimasukkan dalam proses belajar model."
        }
    }
    
    var settingsContent3: String {
        switch language {
        case .korean:
            return "그럼에도 사진을 최대한 객관적으로 분류하기 위해 노력하였으니 많이 이용해주시면 감사하겠습니다."
        case .english:
            return "Nevertheless, I tried to classify the photos as objectively as possible, so I would appreciate it if you could use them a lot."
        case .japanese:
            return "それでも写真を最大限客観的に分類するために努力しましたので、たくさんご利用いただければ幸いです。"
        case .chinese:
            return "尽管如此，我们努力将照片尽可能客观地分类，希望大家多多使用。"
        case .vietnamese:
            return "Tuy nhiên, chúng tôi đã nỗ lực để phân loại ảnh một cách khách quan nhất có thể, vì vậy chúng tôi sẽ rất cảm ơn nếu bạn sử dụng nó nhiều"
        case .Indonesian:
            return "Namun demikian, kami telah berusaha untuk mengklasifikasikan foto secara obyektif mungkin, jadi saya akan sangat menghargai jika Anda bisa menggunakannya banyak."
        }
    }
    
    var screenshotError: String {
        switch language {
        case .korean:
            return "스크린샷을 저장하던중 오류가 발생하였습니다."
        case .english:
            return "An error occurred while saving the screenshot."
        case .japanese:
            return "スクリーンショットの保存中にエラーが発生しました。"
        case .chinese:
            return "保存截图时发生错误。"
        case .vietnamese:
            return "Đã phát sinh lỗi khi lưu ảnh màn hình."
        case .Indonesian:
            return "Terjadi galat ketika menyimpan cuplikan layar."
        }
    }
    
    var onlyOnePeopleShouldAppear: String {
        switch language {
        case .korean:
            return "사진에서 사람은 한명만 나와야 합니다."
        case .english:
            return "Only one person should appear in the picture."
        case .japanese:
            return "写真で人は一人だけ出なければなりません。"
        case .chinese:
            return "照片上只能出现一个人。"
        case .vietnamese:
            return "Chỉ nên có một người xuất hiện trong bức ảnh này."
        case .Indonesian:
            return "Hanya harus ada satu orang dalam gambar ini."
        }
    }
    
    var shouldAppearFace: String {
        switch language {
        case .korean:
            return "눈,코,입이 모두 보이는 사람 사진이어야 합니다."
        case .english:
            return "It should be a picture of a person whose eyes, nose, and mouth are all visible."
        case .japanese:
            return "目、鼻、口がすべて見える人の写真でなければなりません。"
        case .chinese:
            return "必须是眼睛、鼻子、嘴都能看见的人的照片。"
        case .vietnamese:
            return "Phải là ảnh của người nhìn thấy mắt, mũi, miệng."
        case .Indonesian:
            return "Mata, hidung, dan mulut Anda semua harus terlihat oleh seseorang."
        }
    }
    
    var photoRecogError: String {
        switch language {
        case .korean:
            return "사진을 인식하는 데 실패하였습니다."
        case .english:
            return "Failed to recognize picture."
        case .japanese:
            return "写真の認識に失敗しました。"
        case .chinese:
            return "识别照片失败 。"
        case .vietnamese:
            return "Nhận diện hình ảnh đã thất bại."
        case .Indonesian:
            return "Gagal mengenali foto."
        }
    }
    
    var recogErrorTitle: String {
        switch language {
        case .korean:
            return "인식 실패"
        case .english:
            return "Failed recognition"
        case .japanese:
            return "認識失敗"
        case .chinese:
            return "识别失败"
        case .vietnamese:
            return "Nhận diện thất bại"
        case .Indonesian:
            return "Kegagalan pengenalan."
        }
    }
    
    var plzAttachImage: String {
        switch language {
        case .korean:
            return "이미지를 첨부하고 시도해주세요."
        case .english:
            return "Please attach the image and try it."
        case .japanese:
            return "画像を添付してお試しください。"
        case .chinese:
            return "请附上图片后尝试一下。"
        case .vietnamese:
            return "Vui lòng đính kèm hình ảnh và thử."
        case .Indonesian:
            return "Silakan lampirkan gambar dan coba."
        }
    }
    
    var resultAnalysisError: String {
        switch language {
        case .korean:
            return "결과 분석 실패"
        case .english:
            return "Result analysis failed"
        case .japanese:
            return "結果分析の失敗"
        case .chinese:
            return "结果分析失败"
        case .vietnamese:
            return "Phân tích kết quả thất bại"
        case .Indonesian:
            return "Analisis Hasil Gagal"
        }
    }
    
    var languageSettings: String {
        switch language {
        case .korean:
            return "언어설정"
        case .english:
            return "Language"
        case .japanese:
            return "言語設定"
        case .chinese:
            return "语言设置"
        case .vietnamese:
            return "thiết lập ngôn ngữ"
        case .Indonesian:
            return "Pengaturan Bahasa"
        }
    }
    
    var ai: String {
        switch language {
        case .korean:
            return "인공지능"
        case .english:
            return "AI"
        case .japanese:
            return "人工知能"
        case .chinese:
            return "人工智能"
        case .vietnamese:
            return "AI"
        case .Indonesian:
            return "AI"
        }
    }
    
    var facetest: String {
        switch language {
        case .korean:
            return "얼굴평가"
        case .english:
            return "face evaluation"
        case .japanese:
            return "顔評価"
        case .chinese:
            return "人脸评价"
        case .vietnamese:
            return "đánh giá khuôn mặt"
        case .Indonesian:
            return "evaluasi wajah"
        }
    }
    
    var tryAgainWithImage: String {
        switch language {
        case .korean:
            return "이미지를 넣고 시도하세요"
        case .english:
            return "Insert an image and try"
        case .japanese:
            return "画像を入れてみてください"
        case .chinese:
            return "插入图像并尝试"
        case .vietnamese:
            return "Chèn một hình ảnh và thử"
        case .Indonesian:
            return "Masukkan gambar dan coba"
        }
    }
    
    var anotherImage: String {
        switch language {
        case .korean:
            return "다른 사진으로 재시도"
        case .english:
            return "Try again with another picture"
        case .japanese:
            return "別の写真に再試行する"
        case .chinese:
            return "用另一张图片再试一次"
        case .vietnamese:
            return "Hãy thử lại với một hình ảnh khác"
        case .Indonesian:
            return "Coba lagi dengan gambar lain"
        }
    }
    
    var screenshotCompleted: String {
        switch language {
        case .korean:
            return "스크린샷이 저장되었습니다."
        case .english:
            return "Screenshot saved."
        case .japanese:
            return "スクリーンショットが保存されました。"
        case .chinese:
            return "屏幕截图已保存。"
        case .vietnamese:
            return "Đã lưu ảnh chụp màn hình."
        case .Indonesian:
            return "Tangkapan layar disimpan."
        }
    }
    
    func changeLanguage(language: Language) {
        self.language = language
    }
    
    func translateChartResult(message: String) -> String {
        switch message {
        case "씹상타취 부위":
            switch language {
            case .korean:
                return "씹상타취 부위"
            case .english:
                return "awesome parts"
            case .japanese:
                return "とても素敵な場所"
            case .chinese:
                return "很好的地方"
            case .vietnamese:
                return "nơi rất đẹp"
            case .Indonesian:
                return "tempat yang sangat bagus"
            }
        case "상타취 부위":
            switch language {
            case .korean:
                return "상타취 부위"
            case .english:
                return "cool parts"
            case .japanese:
                return "素敵な部位"
            case .chinese:
                return "很酷的部分"
            case .vietnamese:
                return "phần mát mẻ"
            case .Indonesian:
                return "bagian keren"
            }
        case "평타취 부위":
            switch language {
            case .korean:
                return "평타취 부위"
            case .english:
                return "ordinary parts"
            case .japanese:
                return "平凡な部位"
            case .chinese:
                return "普通部分"
            case .vietnamese:
                return "phần bình thường"
            case .Indonesian:
                return "bagian biasa"
            }
        case "하타취 부위":
            switch language {
            case .korean:
                return "하타취 부위"
            case .english:
                return "ugly parts"
            case .japanese:
                return "醜い部位"
            case .chinese:
                return "丑陋的部分"
            case .vietnamese:
                return "bộ phận xấu xí"
            case .Indonesian:
                return "bagian yang jelek"
            }
        case "씹하타취 부위":
            switch language {
            case .korean:
                return "씹하타취 부위"
            case .english:
                return "very ugly parts"
            case .japanese:
                return "すごく醜い部位"
            case .chinese:
                return "非常丑陋的地方"
            case .vietnamese:
                return "nơi rất xấu xí"
            case .Indonesian:
                return "tempat yang sangat jelek"
            }
        default:
            return "error"
        }
    }
    
}
