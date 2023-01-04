//
//  LoadingView.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/03.
//

import SwiftUI

struct LoadingView: View {
    
    @EnvironmentObject private var model: Evaluation
    @State private var showResultPage = false
    
    func loading() async {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        showResultPage = true
    }
    
    var body: some View {
        ZStack {
            Color(uiColor: UIColor(red: 0.24, green: 0.282, blue: 0.663, alpha: 1))
                .ignoresSafeArea()
            if model.isWoman {
                LottieView(jsonName: "woman_loading")
                    .frame(width: 300, height: 300)
            } else {
                LottieView(jsonName: "man_loading")
                    .frame(width: 300, height: 300)
            }
            Image("loading_txt")
                .padding(.top, 200)
        }
        .task {
            await loading()
        }
        .fullScreenCover(isPresented: $showResultPage) {
            ResultView()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
            .environmentObject(Evaluation())
    }
}
