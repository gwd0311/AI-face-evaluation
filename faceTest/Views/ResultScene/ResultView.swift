//
//  ResultView.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/04.
//

import SwiftUI
import ScreenshotSwiftUI
import GoogleMobileAds

struct ResultView: View {
    
    @State private var showShareSheet = false
    @State private var showAlert = false
    @State private var showInterstitalAd = false
    @State private var alertMessage = ""
    @State var interstitial = InterstitialAd()
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var model: Evaluation
    @EnvironmentObject private var language: LanguageManager
    
    private let adUnitId = "ca-app-pub-6301096399153807/9209160669"
    let logoColor = Color(uiColor: UIColor(red: 0.238, green: 0.241, blue: 0.258, alpha: 1))
    
    private func delay() async {
        try? await Task.sleep(nanoseconds: 0_500_000_000)
    }
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Color(uiColor: UIColor(red: 0.967, green: 0.884, blue: 0.592, alpha: 1))
                    .ignoresSafeArea()
                VStack {
                    Button {
                        interstitial.showAd()
                    } label: {
                        Text("test")
                    }

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
                            ResultMessageView()
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
//                                    self.showInterstitalAd.toggle()
                                    dismiss()
                                } label: {
                                    Text(language.anotherImage)
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
//                .presentInterstitialAd(isPresented: $showInterstitalAd, adUnitId: adUnitId)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack(spacing: 5) {
                        if language.language == .japanese || language.language == .chinese {
                            Text(language.ai)
                                .foregroundColor(.black)
                                .font(.system(size: 20, weight: .black))
                            Text(language.facetest)
                                .font(.system(size: 20, weight: .black))
                                .foregroundColor(logoColor)
                        } else {
                            StrokeTextView(text: language.ai, width: 1, color: logoColor)
                                .foregroundColor(.white)
                                .font(.custom("JalnanOTF", size: 20))
                            Text(language.facetest)
                                .font(.custom("JalnanOTF", size: 20))
                                .foregroundColor(logoColor)
                                .fontWeight(.black)
                        }
                    }
                    .padding(.top, 5)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        if model.screenshotImage != nil {
                            UIImageWriteToSavedPhotosAlbum(model.screenshotImage!, nil, nil, nil)
                            alertMessage = language.screenshotCompleted
                            showAlert.toggle()
                        } else {
                            alertMessage = language.screenshotError
                            showAlert.toggle()
                        }
                    } label: {
                        Image("download")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Image("settings")
                    }
                }
            }
        }
        .screenshotMaker { screenshotMaker in
            Task {
                await delay()
                if model.screenshotImage == nil && model.image != nil {
                    let uiImage = screenshotMaker.screenshot()
                    model.updateScreenshotImage(image: uiImage!)
                }
            }
        }
        .sheet(isPresented: $showShareSheet) {
            ShareSheet(itemsToShare: [model.screenshotImage ?? "공유 오류 발생"])
                .environmentObject(model)
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
            .environmentObject(LanguageManager())
    }
}

