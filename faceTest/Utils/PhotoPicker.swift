//
//  PhotoPicker.swift
//  faceTest
//
//  Created by hanjongwoo on 2023/01/05.
//

import Foundation
import SwiftUI
import PhotosUI

struct PhotoPicker: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    @Binding var isPresented: Bool
    @Binding var isEnd: Bool
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: UIViewControllerRepresentableContext<PhotoPicker>) {
        
    }
    
    func updateImage(image: UIImage) {
        
    }
    
    func makeCoordinator() -> PhotoPickerCoordinator {
        return PhotoPickerCoordinator(image: $image, isPresented: $isPresented, isEnd: $isEnd)
    }
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }
}

class PhotoPickerCoordinator: NSObject, PHPickerViewControllerDelegate {
    
    @Binding var image: UIImage?
    @Binding var isPresented: Bool
    @Binding var isEnd: Bool

    init(image: Binding<UIImage?>, isPresented: Binding<Bool>, isEnd: Binding<Bool>) {
        _image = image
        _isPresented = isPresented
        _isEnd = isEnd
    }

    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        guard let provider = results.first?.itemProvider else {
            return
        }

        provider.loadObject(ofClass: UIImage.self) { image, _ in
            Task { @MainActor in
                self.image = image as? UIImage
                self.isPresented = false
                self.isEnd = true
            }
        }

        picker.dismiss(animated: true)
    }
}
