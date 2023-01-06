//
//  LanguageView.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/05.
//

import SwiftUI

struct LanguageView: View {
    
    @EnvironmentObject var language: LanguageManager
    
    private var selectedLanguage: String {
        switch language.language {
        case .korean:
            return "한국어"
        case .english:
            return "English"
        case .japanese:
            return "日本語"
        case .chinese:
            return "中文"
        case .vietnamese:
            return "Tiếng Việt"
        case .Indonesian:
            return "Bahasa Indonesia"
        }
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 18)
                .foregroundColor(Color("black30"))
                .frame(height: 64)
            HStack {
                Spacer().frame(width: 20)
                Image("language")
                Text(language.languageSettings)
                    .foregroundColor(Color("black300"))
                    .font(.system(size: 16, weight: .black))
                Spacer()
                Menu {
                    Button {
                        language.changeLanguage(language: .korean)
                    } label: {
                        Text("한국어")
                    }
                    Button {
                        language.changeLanguage(language: .english)
                    } label: {
                        Text("English")
                    }
                    Button {
                        language.changeLanguage(language: .japanese)
                    } label: {
                        Text("日本語")
                    }
                    Button {
                        language.changeLanguage(language: .chinese)
                    } label: {
                        Text("中文")
                    }
                    Button {
                        language.changeLanguage(language: .vietnamese)
                    } label: {
                        Text("Tiếng Việt")
                    }
                    Button {
                        language.changeLanguage(language: .Indonesian)
                    } label: {
                        Text("Bahasa Indonesia")
                    }
                } label: {
                    HStack {
                        Text(selectedLanguage)
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .semibold))
                        Image("chevron_down")
                    }
                }
                Spacer().frame(width: 20)
            }
        }
    }
}

struct LanguageView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageView()
            .environmentObject(LanguageManager())
    }
}
