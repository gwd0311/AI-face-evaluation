//
//  ContentView.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/02.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isLoading = true
    
    var body: some View {
        if isLoading {
            SplashView(isLoading: $isLoading)
        } else {
            MainPage()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Evaluation())
    }
}
