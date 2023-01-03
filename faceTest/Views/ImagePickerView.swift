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
    @State private var isEnd: Bool = false
    @State private var image: UIImage?
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @Binding var classificationLabel: String
    @Binding var classificationRatio: String
    
    private let classifier = VisionClassifier(mlModel: BoyClassifier().model)
    
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
        isEnd = false
        classify()
    }
    
    var body: some View {
        VStack {
            Button {
                self.showSheet = true
            } label: {
                if isEnd || showPhotoOptions {
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
                    Image(uiImage: (image ?? UIImage(systemName: "plus"))!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 250, height: 250)))
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
            if !isEnd {
                Text(classificationLabel)
                Text(classificationRatio)
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
        ImagePickerView(classificationLabel: .constant("하하"), classificationRatio: .constant("10%"))
    }
}
