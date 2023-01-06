//
//  ShareSheet.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/04.
//

import Foundation
import UIKit
import SwiftUI

struct ShareSheet: UIViewControllerRepresentable {
    var itemsToShare: [Any]
    var servicesToShareItem: [UIActivity]? = nil
    func makeUIViewController(context: UIViewControllerRepresentableContext<ShareSheet>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: itemsToShare, applicationActivities: servicesToShareItem)
        return controller
    }
    func updateUIViewController(_ uiViewController: UIActivityViewController,
                                context: Context) {}
}
