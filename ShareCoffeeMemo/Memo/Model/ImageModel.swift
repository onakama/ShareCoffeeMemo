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
    
    func stringDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmmss"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tokyo")
        let str = dateFormatter.string(from: date)
        print(str)
        return str
    }
    
    // ディレクトリのパスにファイル名をつなげてファイルのフルパスを作る
    func fileInDocumentsDirectory(date: Date) -> String {
        let strName = stringDate(date: date)
        let fileURL = getDocumentsURL().appendingPathComponent(strName)
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
