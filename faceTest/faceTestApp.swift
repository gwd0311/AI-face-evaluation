//
//  faceTestApp.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/02.
//

import SwiftUI

@main
struct faceTestApp: App {
    
    @StateObject private var model: Evaluation
    
    init() {
        _model = StateObject(wrappedValue: Evaluation())
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
