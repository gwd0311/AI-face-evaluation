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
    
    @Binding var image: UIImage?
    @Binding var classificationLabel: String
    @Binding var classificationRatio: String
    @Binding var isWoman: Bool
    @Binding var isEnd: Bool
    @Binding var results: [Analysis]
    
    private let boyClassifier = VisionClassifier(mlModel: BoyClassifier().model)
    private let girlClassifier = VisionClassifier(mlModel: GirlClassifier().model)
    
    private func classify() {
        self.results = []
        if let img = self.image {
            // perform image classification
            
            let classifier = isWoman ? girlClassifier : boyClassifier
            
            classifier?.classify(img) { results in
                self.classificationLabel = results.first?.identifier ?? ""
                self.classificationRatio = results.first?.confidence.description ?? ""
                
                for result in results {
                    self.results.append(Analysis(label: result.identifier, ratio: result.confidence.binade))
                }
                print(self.results)
            }
        }
    }
    
    var body: some View {
        VStack {
            Button {
                self.results = []
                self.isEnd = false
                self.showSheet = true
            } label: {
                Image(uiImage: image ?? (isWoman ? UIImage(named: "robot_woman")! : UIImage(named: "robot_man")!))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 216, height: 216)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .shadow(color: Color(uiColor: UIColor(red: 0.04, green: 0.035, blue: 0.271, alpha: 0.12)), radius: 20, x: 0, y: 0)
                    .overlay {
                        if !isEnd {
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
                image: self.$image,
                isShown: self.$showPhotoOptions,
                isEnd: $isEnd,
                sourceType: self.sourceType
            )
        }
    }
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView(image: .constant(nil), classificationLabel: .constant("하하"), classificationRatio: .constant("10%"), isWoman: .constant(true), isEnd: .constant(false), results: .constant([]))
    }
}
