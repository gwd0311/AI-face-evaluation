//
//  strokeTextView.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/04.
//

import SwiftUI

struct StrokeTextView: View {
    let text: String
    let width: CGFloat
    let color: Color

    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}

struct StrokeTextView_Previews: PreviewProvider {
    static var previews: some View {
        StrokeTextView(text: "인공지능", width: 2, color: .black)
            .foregroundColor(.white)
            .font(.custom("JalnanOTF", size: 24))
    }
}
