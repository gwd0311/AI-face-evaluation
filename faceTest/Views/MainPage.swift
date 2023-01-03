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
    @State private var isLeft = true
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Spacer().frame(height: 32)
                Text("인공지능 AI가 당신의 얼굴이 \n몇타취인지 분석합니다.")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 27)
                
                GenderPickerView(leftTitle: "여성", rightTitle: "남성", isLeft: $isLeft)
                    .padding(.bottom, 50)
                
                ImagePickerView(
                    classificationLabel: $classificationLabel,
                    classificationRatio: $classificationRatio,
                    isWoman: $isLeft
                )

                Spacer()
                
                Text("업로드한 사진은 ")
                    .font(.system(size: 14))
                + Text("분석에만 이용") + Text("되며, ") + Text("저장하지 않습니다.")
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
