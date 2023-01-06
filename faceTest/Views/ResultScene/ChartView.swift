//
//  ChartView.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/04.
//

import SwiftUI

struct ChartView: View {
    
    @EnvironmentObject var language: LanguageManager
    
    let title: String
    let ratio: String
    let color: Color
    
    var body: some View {
        VStack {
            HStack {
                Text(language.translateChartResult(message: title))
                    .fontWeight(.semibold)
                    .font(.system(size: 14))
                Spacer()
                Text("\(ratio)%")
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(color)
            }
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 6)
                    .frame(height: 14)
                    .foregroundColor(Color(uiColor: UIColor(red: 0.938, green: 0.94, blue: 0.95, alpha: 1)))
                VStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 6)
                        .frame(width: (UIScreen.main.bounds.width - 48) * ratio.toPercent , height: 14)
                        .foregroundColor(color)
                }
            }
        }
        .padding(.horizontal, 24)
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(title: "씹상타취부위", ratio: "0.84".toInteger, color: .blue)
            .environmentObject(LanguageManager())
    }
}
