//
//  TestOperation.swift
//  Presentation
//
//  Created by Jonathan Eduardo Meriño Bolívar - Ceiba Software on 15/11/22.
//

import UIKit

class TestOperation: Operation {
    
    var inputImage: UIImage?
    var outputImage: UIImage?
    
    init(inputImage: UIImage) {
        self.inputImage = inputImage
    }
    
    override public func main() {
        if self.isCancelled {
            return
        }
        outputImage = applyMonoEffectTo(image: inputImage)
    }
    
    private func applyMonoEffectTo(image: UIImage?) -> UIImage? {
        guard let image = image,
              let ciImage = CIImage(image: image),
              let mono = CIFilter(name: "CIPhotoEffectMono",
                                  parameters: [kCIInputImageKey: ciImage])
        else { return nil }
        
        let ciContext = CIContext()
        guard let monoImage = mono.outputImage,
              let cgImage = ciContext.createCGImage(monoImage, from: monoImage.extent)
        else { return nil }
        
        return UIImage(cgImage: cgImage)
    }
}

