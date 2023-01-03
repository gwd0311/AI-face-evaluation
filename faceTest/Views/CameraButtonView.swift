//
//  CameraButtonView.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/03.
//

import SwiftUI

struct CameraButtonView: View {
    var body: some View {
        Circle()
            .strokeBorder(Color(uiColor: UIColor(red: 0.918, green: 0.918, blue: 0.925, alpha: 1)), lineWidth: 2)
            .frame(width: 60, height: 60)
            .background(.white)
            .clipShape(Circle())
            .shadow(color: Color(uiColor: UIColor(red: 0.04, green: 0.035, blue: 0.271, alpha: 0.12)), radius: 14, x: 2, y: 4)
            .padding(.top, 180)
            .padding(.leading, 180)
            .overlay {
                Image("camera")
                    .padding(.top, 180)
                    .padding(.leading, 180)
            }
    }
}

struct CameraButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CameraButtonView()
    }
}
