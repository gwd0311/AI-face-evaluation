//
//  AIDescriptionView.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/05.
//

import SwiftUI

struct AIDescriptionView: View {
    
    @EnvironmentObject var language: LanguageManager
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(language.settingsContent1)
                .font(.system(size: 16))
                .foregroundColor(Color("black600"))
            .padding(.bottom, 12)
        
            Text(language.settingsContent2)
                .font(.system(size: 16))
                .foregroundColor(Color("black600"))
            .padding(.bottom, 12)
            
            Text(language.settingsContent3)
                .font(.system(size: 16))
                .foregroundColor(Color("black600"))
        }
    }
}

struct AIDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        AIDescriptionView()
            .environmentObject(LanguageManager())
    }
}
