//
//  UploadDescriptionView.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/03.
//

import SwiftUI

struct UploadDescriptionView: View {
    
    @EnvironmentObject var language: LanguageManager
    
    var body: some View {
        switch language.language {
        case .korean:
            return Text("업로드한 사진은 ")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            + Text("분석에만 이용")
                .font(.system(size: 14))
                .fontWeight(.black)
                .foregroundColor(Color(uiColor: .darkGray))
            + Text("되며, ")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            + Text("저장하지 않습니다.")
                .font(.system(size: 14))
                .fontWeight(.black)
                .foregroundColor(Color(uiColor: .darkGray))
        }
        
    }
}

struct UploadDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        UploadDescriptionView()
    }
}
