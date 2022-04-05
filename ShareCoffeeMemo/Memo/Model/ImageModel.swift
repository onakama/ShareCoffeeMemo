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
    
    //ローカル保存
    func saveImage (image: UIImage, path: String) -> Bool {
        let pngImageData = UIImage.pngData(image)
        do {
            try pngImageData()!.write(to: URL(fileURLWithPath: path))
        } catch {
            print(error)
            return false
        }
        return true
    }
    
    //ローカル取得
    func loadImage(path: String) -> UIImage? {
        let image = UIImage(contentsOfFile: path)
        
        if image == nil {
            print("missing image at: \(path)")
        }
        return image
    }
    
//    //リモート保存
//    func uploadImage(image: UIImage, path: String){
//        let credentialsProvider = AWSCognitoCredentialsProvider(regionType:.APNortheast1,identityPoolId:"ap-northeast-1:9507d480-0afd-4d15-8915-3082b8b6d2fe")
//        let configuration = AWSServiceConfiguration(region:.APNortheast1, credentialsProvider:credentialsProvider)
//        AWSServiceManager.default().defaultServiceConfiguration = configuration
//        let transferUtility = AWSS3TransferUtility.default()
//        let data = image.pngData()!
//        // アップロードするバケット名/アップしたいディレクトリ
//        let bucket = "onakama-coffee-image"
//        // ファイル名
//        let key = path
//        let contentType = "image/png"
//        // アップロード中の処理
//        let expression = AWSS3TransferUtilityUploadExpression()
//        expression.progressBlock = {(task, progress) in
//            DispatchQueue.main.async {
//           // アップロード中の処理をここに書く
//
//            }
//        }
//        // アップロード後の処理
//        let completionHandler: AWSS3TransferUtilityUploadCompletionHandlerBlock?
//        completionHandler = { (task, error) -> Void in
//           DispatchQueue.main.async {
//             if let error = error {
//                print(error.localizedDescription) // 失敗
//             } else {
//                // アップロード後の処理をここに書く
//             }
//           }
//         }
//
//
//         // アップロード
//         transferUtility.uploadData(
//           data,
//           bucket: bucket,
//           key: key,
//           contentType: contentType,
//           expression: expression,
//           completionHandler: completionHandler
//         ).continueWith { (task) -> Any? in
//           if let error = task.error as NSError? {
//               print(error.localizedDescription)
//           } else {
//               // アップロードが始まった時の処理をここに書く
//           }
//           return nil
//         }
//       }
}
