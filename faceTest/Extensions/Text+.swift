//
//  Text+.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/05.
//

import Foundation
import SwiftUI

extension Text {
    
    func toDescription() -> some View {
        self
            .modifier(DescriptionTextModifier())
    }
    
}
