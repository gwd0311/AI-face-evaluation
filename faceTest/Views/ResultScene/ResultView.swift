//
//  ResultView.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/04.
//

import SwiftUI
import ScreenshotSwiftUI

struct ResultView: View {
    
    @State private var showShareSheet = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var model: Evaluation
    let logoColor = Color(uiColor: UIColor(red: 0.238, green: 0.241, blue: 0.258, alpha: 1))
    
    func shareSheet(url: String) {
        let url = URL(string: url)
        let activityView = UIActivityViewController(activityItems: [url ?? "dd"], applicationActivities: nil)

        let allScenes = UIApplication.shared.connectedScenes
        let scene = allScenes.first { $0.activationState == .foregroundActive }

        if let windowScene = scene as? UIWindowScene {
            windowScene.keyWindow?.rootViewController?.present(activityView, animated: true, completion: nil)
        }

    }
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color(uiColor: UIColor(red: 0.967, green: 0.884, blue: 0.592, alpha: 1))
                    .ignoresSafeArea()
                VStack {
                    Spacer().frame(height: 24)
                    HStack {
                        Image("l_leaf")
                            .padding(.top, 40)
                            .padding(.trailing, 5)
                        Image(uiImage: model.image ?? UIImage(named: "robot_man")!)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 118, height: 118)
                            .clipShape(Circle())
                        Image("r_leaf")
                            .padding(.top, 40)
                            .padding(.leading, 5)
                    }
                    Spacer().frame(height: 32)
                    ZStack {
                        Color.white
                            .cornerRadius(40)
                            .ignoresSafeArea()
                        ScrollView {
                            Spacer().frame(height: 24)
                            Text("당신은 ")
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                            + Text(model.results.first?.label.toTitleLabel ?? "레이블 오류")
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                                .foregroundColor(model.results.first?.label.toColor ?? .black)
                            + Text("입니다!")
                                .fontWeight(.bold)
                                .font(.system(size: 20))
                            Spacer().frame(height: 16)
                            Divider()
                                .padding(.horizontal, 24)
                                .padding(.bottom, 26)
                            ForEach(model.results) { result in
                                ChartView(title: result.label.toChartLabel ?? "레이블 오류 발생", ratio: result.ratio.toInteger, color: result.label.toColor ?? .black)
                            }
                            Spacer()
                        }
                        VStack {
                            Spacer()
                            HStack {
                                Button {
                                    model.isLoading = false
                                    model.initializeAll()
                                    dismiss()
                                } label: {
                                    Text("다른사진으로 재시도")
                                        .fontWeight(.black)
                                        .font(.system(size: 18))
                                        .frame(maxWidth: .infinity, maxHeight: 56)
                                        .frame(height: 56)
                                }
                                .buttonStyle(MainButtonStyle(color: Color(uiColor: UIColor(red: 0.271, green: 0.427, blue: 0.976, alpha: 1))))
                                Button {
                                    showShareSheet.toggle()
                                } label: {
                                    RoundedRectangle(cornerRadius: 14)
                                        .stroke(Color(uiColor: UIColor(red: 0.918, green: 0.918, blue: 0.925, alpha: 1)), lineWidth: 1)
                                        .foregroundColor(.white)
                                        .frame(width: 60, height: 56)
                                        .overlay(
                                            Image("share")
                                        )
                                }

                            }
                            .padding(.horizontal, 24)
                            .padding(.bottom, 20)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack(spacing: 5) {
                        StrokeTextView(text: "인공지능", width: 1, color: logoColor)
                            .foregroundColor(.white)
                            .font(.custom("JalnanOTF", size: 20))
                        Text("얼굴평가")
                            .font(.custom("JalnanOTF", size: 20))
                            .foregroundColor(logoColor)
                            .fontWeight(.black)
                    }
                    .padding(.top, 5)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        if model.screenshotImage != nil {
                            UIImageWriteToSavedPhotosAlbum(model.screenshotImage!, nil, nil, nil)
                            alertMessage = "스크린샷이 저장되었습니다."
                            showAlert.toggle()
                        } else {
                            alertMessage = "스크린샷이 저장 중 오류가 발생하였습니다."
                            showAlert.toggle()
                        }
                    } label: {
                        Image("download")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image("settings")
                }
            }
        }
        .screenshotMaker { screenshotMaker in
            if model.screenshotImage == nil {
                let uiImage = screenshotMaker.screenshot()
                model.updateScreenshotImage(image: uiImage!)
            }
        }
        .sheet(isPresented: $showShareSheet) {
            ShareSheet(itemsToShare: [model.screenshotImage!])
        }
        .alert("", isPresented: $showAlert) {
            Text("")
        } message: {
            Text(alertMessage)
        }

    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
            .environmentObject(Evaluation())
    }
}
