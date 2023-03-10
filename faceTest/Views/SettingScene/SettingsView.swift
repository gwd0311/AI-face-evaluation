//
//  SettingsView.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/04.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var language: LanguageManager
    @State private var selectedValue = 0
    let titleColor = Color("blue")
    
    var body: some View {
        VStack {
            Spacer().frame(height: 16)
            
            HStack {
                Text("인공지능 얼굴분석")
                    .font(.system(size: 20, weight: .black))
                    .foregroundColor(titleColor)
                + Text("이 뭔가요?")
                    .font(.system(size: 20, weight: .black))
                
                Spacer()
            }
            .padding(.bottom, 16)
            
            Image("question")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .padding(.bottom, 24)
            
            AIDescriptionView()
                .padding(.bottom, 40)
            
            Spacer()
        }
        .padding(20)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    dismiss()
                } label: {
                    Image("delete")
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(LanguageManager())
    }
}


