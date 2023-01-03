//
//  MainPage.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/02.
//

import SwiftUI

struct MainPage: View {
    
    @State private var classificationLabel: String = ""
    @State private var classificationRatio: String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("인공지능 AI가 당신의 얼굴이 \n몇타취인지 분석합니다.")
                    .multilineTextAlignment(.center)
                
                
                
                ImagePickerView(classificationLabel: $classificationLabel, classificationRatio: $classificationRatio)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("인공지능 얼굴평가")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "gear")
                }
            }
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
