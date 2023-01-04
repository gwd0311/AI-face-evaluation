//
//  GenderPickerView.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/03.
//

import SwiftUI

struct GenderPickerView: View {
    
    let leftTitle: String
    let rightTitle: String
    
    // 버튼 커스텀 속성들
    private let leftButtonColor = Color(uiColor: UIColor(red: 0.366, green: 0.316, blue: 0.938, alpha: 1))
    private let rightButtonColor = Color(uiColor: UIColor(red: 0.271, green: 0.427, blue: 0.976, alpha: 1))
    private let leftTitleColor = Color.white
    private let rightTitleColor = Color.gray
    private let cornerRadius = 27.5
    
    @EnvironmentObject private var model: Evaluation
    // 슬라이드 효과를 주기위해서 사용
    @Namespace var animation
    
    var body: some View {
        HStack {
            Text(leftTitle)
                .fontWeight(.bold)
                .padding(.vertical, 14)
                .padding(.horizontal, 45)
                .background {
                    ZStack {
                        if model.isWoman {
                            leftButtonColor
                                .cornerRadius(cornerRadius)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }
                    }
                }
                .foregroundColor(model.isWoman ? leftTitleColor : rightTitleColor)
                .onTapGesture {
                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)) {
                        model.isWoman = true
                        model.initializeAll()
                    }
                }
            
            Text(rightTitle)
                .fontWeight(.bold)
                .padding(.vertical, 14)
                .padding(.horizontal, 45)
                .background {
                    ZStack {
                        if !model.isWoman {
                            rightButtonColor
                                .cornerRadius(cornerRadius)
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }
                    }
                }
                .foregroundColor(!model.isWoman ? leftTitleColor : rightTitleColor)
                .onTapGesture {
                    withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)) {
                        model.isWoman = false
                        model.initializeAll()
                    }
                }
        }
        .background(Color.black.opacity(0.04))
        .cornerRadius(cornerRadius)
    }
}

struct GenderPickerView_Previews: PreviewProvider {
    static var previews: some View {
        GenderPickerView(leftTitle: "여성", rightTitle: "남성")
    }
}
