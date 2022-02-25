//
//  ImageModel.swift
//  ShareCoffeeMemo
//
//  Created by 住山大誠 on 2022/02/24.
//

import Foundation
import SwiftUI

class ImageModel {
    // DocumentディレクトリのfileURLを取得
    func getDocumentsURL() -> NSURL {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] as NSURL
        return documentsURL
    }
    
    // ディレクトリのパスにファイル名をつなげてファイルのフルパスを作る
    func fileInDocumentsDirectory(filename: String) -> String {
        let fileURL = getDocumentsURL().appendingPathComponent(filename)
        return fileURL!.path
    }
    
    func saveImage (image: UIImage, path: String ) -> Bool {
        let pngImageData = UIImage.pngData(image)
        do {
            try pngImageData()!.write(to: URL(fileURLWithPath: path))
        } catch {
            print(error)
            return false
        }
        return true
    }
    
    func loadImage(path: String) -> UIImage? {
        let image = UIImage(contentsOfFile: path)
        
        if image == nil {
            print("missing image at: \(path)")
        }
        return image
    }
}
