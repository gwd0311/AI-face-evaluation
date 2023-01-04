//
//  ResultView.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/04.
//

import SwiftUI

struct ResultView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var model: Evaluation
    
    var body: some View {
        Button {
            model.isLoading.toggle()
            dismiss()
        } label: {
            Text("메인페이지로 돌아가기")
        }

    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
