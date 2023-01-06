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
        case .english:
            return Text("You are ")
                .fontWeight(.bold)
                .font(.system(size: 20))
            + Text(model.resultMessage)
                .fontWeight(.bold)
                .font(.system(size: 20))
                .foregroundColor(model.results.first?.label.toColor ?? .black)
            + Text("!")
                .fontWeight(.bold)
                .font(.system(size: 20))
        case .japanese:
            return Text("あなたは ")
                .fontWeight(.bold)
                .font(.system(size: 20))
            + Text(model.resultMessage)
                .fontWeight(.bold)
                .font(.system(size: 20))
                .foregroundColor(model.results.first?.label.toColor ?? .black)
            + Text("です!")
                .fontWeight(.bold)
                .font(.system(size: 20))
        case .chinese:
            return Text("你是 ")
                .fontWeight(.bold)
                .font(.system(size: 20))
            + Text(model.resultMessage)
                .fontWeight(.bold)
                .font(.system(size: 20))
                .foregroundColor(model.results.first?.label.toColor ?? .black)
        case .vietnamese:
            return Text("Bạn là ")
                .fontWeight(.bold)
                .font(.system(size: 20))
            + Text(model.resultMessage)
                .fontWeight(.bold)
                .font(.system(size: 20))
                .foregroundColor(model.results.first?.label.toColor ?? .black)
            + Text("!")
                .fontWeight(.bold)
                .font(.system(size: 20))
        case .Indonesian:
            return Text("Dan kau ")
                .fontWeight(.bold)
                .font(.system(size: 20))
            + Text(model.resultMessage)
                .fontWeight(.bold)
                .font(.system(size: 20))
                .foregroundColor(model.results.first?.label.toColor ?? .black)
        }
    }
}


struct ResultMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ResultMessageView()
            .environmentObject(Evaluation())
    }
}
