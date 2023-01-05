//
//  ImagePickerView.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/03.
//

import SwiftUI
import Vision
import PhotosUI

struct ImagePickerView: View {
    
    @State private var showPhotoPicker: Bool = false
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @EnvironmentObject private var model: Evaluation
    
    private let boyClassifier = VisionClassifier(mlModel: BoyClassifier().model)
    private let girlClassifier = VisionClassifier(mlModel: GirlClassifier().model)
    
    private func detectFace() {
        
        Task { @MainActor in
            model.initializeResults()
        }
        
        if let img = model.image {
            print(img)
            let detector = FaceDetector()
            detector.detect(img) { results in
                if results.count == 1 {
                    self.classify()
                } else if results.count > 1 {
                    self.alertMessage = "사람 한명만 해주세요"
                    self.showAlert = true
                    Task { @MainActor in
                        model.initializeAll()
                    }
                } else {
                    self.alertMessage = "눈코입이 다보이는 사람 사진으로 해주세요"
                    self.showAlert = true
                    Task { @MainActor in
                        model.initializeAll()
                    }
                }
            }
        } else {
            alertMessage = "사진을 인식하는데 실패하였습니다. 다른 사진으로 해주세요"
            showAlert = true
        }
    }
    
    private func classify() {
        Task { @MainActor in
            model.initializeResults()
        }

        if let img = model.image {
            // perform image classification
            
            let classifier = model.isWoman ? girlClassifier : boyClassifier
            
            classifier?.classify(img) { results in
                
                for result in results {
                    let analysis = Analysis(label: result.identifier, ratio: result.confidence.description)
                    Task { @MainActor in
                        model.appendResults(analysis: analysis)
                        print(model.results)
                    }
                }
            }
        }
    }
    
    var body: some View {
        VStack {
            Button {
                model.initializeResults()
                model.initializeEnd()
                self.showPhotoPicker = true
            } label: {
                Image(uiImage: model.image ?? (model.isWoman ? UIImage(named: "robot_woman")! : UIImage(named: "robot_man")!))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 216, height: 216)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(color: Color(uiColor: UIColor(red: 0.04, green: 0.035, blue: 0.271, alpha: 0.12)), radius: 20, x: 0, y: 0)
                    .overlay {
                        if !model.isClassificationEnd {
                            CameraButtonView()
                        } else {
                            CameraButtonView()
                                .onAppear {
                                    detectFace()
                                }
                        }
                    }
            }
        }
        .sheet(isPresented: $showPhotoPicker) {
            PhotoPicker(
                image: $model.image,
                isPresented: self.$showPhotoPicker,
                isEnd: $model.isClassificationEnd
            )
        }
        .alert("인식 실패", isPresented: $showAlert) {
            Text("")
        } message: {
            Text(alertMessage)
        }

    }
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView()
            .environmentObject(Evaluation())
    }
}
