//
//  SplashView.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/04.
//

import SwiftUI

struct SplashView: View {
    
    @Binding var isLoading: Bool
    
    func loading() async {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        isLoading = false
    }
    
    var body: some View {
        ZStack {
            let purple = UIColor(red: 0.318, green: 0.38, blue: 0.937, alpha: 1)
            let blue = UIColor(red: 0.448, green: 0.308, blue: 1, alpha: 1)
            LinearGradient(colors: [Color(uiColor: blue), Color(uiColor: purple)], startPoint: .init(x: 0.25, y: 0.5), endPoint: .init(x: 0.75, y: 0.5))
                .ignoresSafeArea()
            LottieView(jsonName: "splash", loopMode: .playOnce)
                .frame(width: 250, height: 250)
        }
        .task {
            await loading()
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(isLoading: .constant(true))
    }
}
