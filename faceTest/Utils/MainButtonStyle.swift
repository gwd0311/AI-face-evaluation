//
//  MainButtonStyle.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/03.
//

import SwiftUI

struct MainButtonStyle: ButtonStyle {
    
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.system(size: 20))
            .foregroundColor(.white)
            .background(color)
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
    
}

struct MainButtonStyle_Previes: PreviewProvider {
    static var previews: some View {
        Button {
            print("button clicked!")
        } label: {
            Text("송금하기")
        }
        .buttonStyle(MainButtonStyle(color: .blue))
    }
}
