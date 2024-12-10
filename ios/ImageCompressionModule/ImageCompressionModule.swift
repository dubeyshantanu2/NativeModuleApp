import Foundation
import UIKit

@objc(ImageCompressionModule)
class ImageCompressionModule: NSObject {

  @objc
  func compressImage(_ imagePath: String, resolver: @escaping RCTPromiseResolveBlock, rejecter: @escaping RCTPromiseRejectBlock) {
    guard let image = UIImage(contentsOfFile: imagePath) else {
      rejecter("image_not_found", "Image not found at path: \(imagePath)", nil)
      return
    }

    guard let compressedData = image.jpegData(compressionQuality: 0.5) else {
      rejecter("compression_failed", "Image compression failed", nil)
      return
    }

    let compressedPath = (imagePath as NSString).deletingPathExtension + "_compressed.jpg"
    let compressedUrl = URL(fileURLWithPath: compressedPath)

    do {
      try compressedData.write(to: compressedUrl)
      resolver(compressedPath)
    } catch {
      rejecter("compression_failed", "Image compression failed", error)
    }
  }
}

