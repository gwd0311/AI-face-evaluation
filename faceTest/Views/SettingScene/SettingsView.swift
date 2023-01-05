//
//  SettingsView.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/04.
//

import SwiftUI

struct SettingsView: View {
    
    let titleColor = Color("blue")
    
    var body: some View {
        VStack {
            HStack {
                Text("인공지능 얼굴평가")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(titleColor)
                + Text("가 뭔가요?")
                    .font(.system(size: 20, weight: .black))
                Spacer()
            }
            .padding(.bottom, 16)
            Image("question")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
            AIDescriptionView()
        }
        .padding(20)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Image("delete")
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
