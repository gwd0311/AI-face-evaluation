//
//  ResultMessageView.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/06.
//

import SwiftUI

struct ResultMessageView: View {
    
    @EnvironmentObject var model: Evaluation
    @EnvironmentObject var language: LanguageManager
    
    var body: some View {
        switch language.language {
        case .korean:
            return Text("당신은 ")
                .fontWeight(.bold)
                .font(.system(size: 20))
            + Text(model.resultMessage)
                .fontWeight(.bold)
                .font(.system(size: 20))
                .foregroundColor(model.results.first?.label.toColor ?? .black)
            + Text("입니다!")
                .fontWeight(.bold)
                .font(.system(size: 20))
        }
    }
}


struct ResultMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ResultMessageView()
            .environmentObject(Evaluation())
    }
}
