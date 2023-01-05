//
//  AIDescriptionView.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/05.
//

import SwiftUI

struct AIDescriptionView: View {
    var body: some View {
        Text("인공지능 얼굴평가는 미리학습된 ")
//            .modifier(DescriptionTextModifier())
        + Text("2500장의 데이터")
        + Text("를 5개의 분류로 나누어 학습시킨 기계학습 모델이 도입된 어플리케이션 입니다.\n\n")
        + Text("모델을 학습시키는 과정에서 ")
        + Text("주관성")
        + Text("이 들어갈 수 있기 때문에 결과는 ")
        + Text("부정확")
        + Text("할 수 있습니다.\n\n")
        + Text("그럼에도 사진을 최대한 객관적으로 분류하기 위해 노력하였으니 많이 이용해주시면 감사하겠습니다.")
    }
}

struct AIDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        AIDescriptionView()
    }
}

struct DescriptionTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color("black300"))
            .font(.system(size: 16, weight: .bold))
    }
}
