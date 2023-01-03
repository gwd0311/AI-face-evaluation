//
//  MainPage.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/02.
//

import SwiftUI

struct MainPage: View {
    
    @EnvironmentObject private var model: Evaluation
    
    let womanColor = Color(uiColor: UIColor(red: 0.366, green: 0.316, blue: 0.938, alpha: 1))
    let manColor = Color(uiColor: UIColor(red: 0.271, green: 0.427, blue: 0.976, alpha: 1))
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Spacer().frame(height: 32)
                Text("인공지능 AI가 당신의 얼굴이 \n몇타취인지 분석합니다.")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 27)
                
                GenderPickerView( leftTitle: "여성", rightTitle: "남성")
                    .padding(.bottom, 50)
                
                ImagePickerView()

                Spacer()
                
                UploadDescriptionView()
                
                Spacer().frame(height: 16)
                
                Text(model.results.first?.label.description ?? "")
                
                Button {
                    // 네비게이션 타고 로딩 페이지로 이동
                } label: {
                    Text("결과 분석")
                        .font(.system(size: 18))
                        .fontWeight(.black)
                        .frame(maxWidth: .infinity, maxHeight: 56)
                }
                .buttonStyle(MainButtonStyle(color: model.isWoman ? womanColor : manColor))
                .padding(.horizontal, 24)
                .padding(.bottom, 20)
                
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
