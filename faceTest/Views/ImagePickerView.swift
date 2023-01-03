//
//  ImagePickerView.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/03.
//

import SwiftUI
import Vision

struct ImagePickerView: View {
    
    @State private var showPhotoOptions: Bool = false
    @State private var showSheet: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @EnvironmentObject private var model: Evaluation
    
    private let boyClassifier = VisionClassifier(mlModel: BoyClassifier().model)
    private let girlClassifier = VisionClassifier(mlModel: GirlClassifier().model)
    
    private func classify() {
        model.initializeResults()

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
                self.showSheet = true
            } label: {
                Image(uiImage: model.image ?? (model.isWoman ? UIImage(named: "robot_woman")! : UIImage(named: "robot_man")!))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 216, height: 216)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .shadow(color: Color(uiColor: UIColor(red: 0.04, green: 0.035, blue: 0.271, alpha: 0.12)), radius: 20, x: 0, y: 0)
                    .overlay {
                        if !model.isClassificationEnd {
                            CameraButtonView()
                        } else {
                            CameraButtonView()
                                .onAppear {
                                    classify()
                                }
                        }
                    }
            }
            .actionSheet(isPresented: $showSheet) {
                ActionSheet(
                    title: Text("사진 선택"),
                    message: Text("사진을 선택해주세요."),
                    buttons: [
                        .default(Text("사진에서 가져오기")) {
                            // open photo library
                            self.showPhotoOptions = true
                            self.sourceType = .photoLibrary
                        },
                        .default(Text("카메라로 촬영해서 가져오기")) {
                            // open camera
                            self.showPhotoOptions = true
                            self.sourceType = .camera
                        },
                        .cancel()
                    ]
                )
            }
        }
        .sheet(isPresented: $showPhotoOptions) {
            ImagePicker(
                image: $model.image,
                isShown: self.$showPhotoOptions,
                isEnd: $model.isClassificationEnd,
                sourceType: self.sourceType
            )
        }
    }
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView()
    }
}
