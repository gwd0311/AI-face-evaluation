//
//  ImagePickerView.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/03.
//

import SwiftUI

struct ImagePickerView: View {
    
    @State private var showPhotoOptions: Bool = false
    @State private var showSheet: Bool = false
    @State private var isProgress: Bool = false
    @State private var isEnd: Bool = false
    @State private var image: UIImage?
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @Binding var classificationLabel: String
    @Binding var classificationRatio: String
    @Binding var isWoman: Bool
    
    private var classifier = VisionClassifier(mlModel: BoyClassifier().model)
    
    private func classify() {
        if let img = self.image {
            // perform image classification
            
            self.classifier?.classify(img) { results in
                self.classificationLabel = results.first?.identifier ?? ""
                self.classificationRatio = results.first?.confidence.description ?? ""
            }
        }
    }
    
    private func delayAnalysis() async {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        isProgress = false
        classify()
        isEnd = true
    }
    
    var body: some View {
        VStack {
            Button {
                self.showSheet = true
            } label: {
                if isProgress {
                    ProgressView()
                        .frame(width: 300, height: 300)
                        .overlay {
                            Text("인공지능이 당신의 얼굴을 분석 중입니다...")
                                .foregroundColor(.black)
                                .padding(.top, 80)
                        }
                        .task {
                            await delayAnalysis()
                        }
                } else {
                    Image(uiImage: image ?? (isWoman ? UIImage(named: "robot_woman")! : UIImage(named: "robot_man")!))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 216, height: 216)
                        .overlay {
                            if !isEnd {
                                Circle()
                                    .strokeBorder(Color(uiColor: UIColor(red: 0.918, green: 0.918, blue: 0.925, alpha: 1)), lineWidth: 2)
                                    .frame(width: 60, height: 60)
                                    .background(.white)
                                    .clipShape(Circle())
                                    .padding(.top, 180)
                                    .padding(.leading, 180)
                                    .overlay {
                                        Image("camera")
                                            .padding(.top, 180)
                                            .padding(.leading, 180)
                                    }
                            }
                        }
                }
                
            }
            .actionSheet(isPresented: $showSheet) {
                ActionSheet(
                    title: Text("Select Photo"),
                    message: Text("Choose"),
                    buttons: [
                        .default(Text("Photo Library")) {
                            // open photo library
                            self.showPhotoOptions = true
                            self.sourceType = .photoLibrary
                        },
                        .default(Text("Camera")) {
                            // open camera
                            self.showPhotoOptions = true
                            self.sourceType = .camera
                        },
                        .cancel()
                    ]
                )
            }
            if !isProgress {
                Text(classificationLabel)
                Text(classificationRatio)
            }
        }
        .sheet(isPresented: $showPhotoOptions) {
            ImagePicker(
                image: self.$image,
                isShown: self.$showPhotoOptions,
                isProgress: $isProgress,
                sourceType: self.sourceType
            )
        }
    }
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView(classificationLabel: .constant("하하"), classificationRatio: .constant("10%"), isWoman: .constant(true))
    }
}
