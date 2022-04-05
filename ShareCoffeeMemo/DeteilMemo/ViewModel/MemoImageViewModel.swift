//
//  MemoImageViewModel.swift
//  ShareCoffeeMemo
//
//  Created by 住山大誠 on 2022/03/12.
//

import Foundation
import SwiftUI

class MemoImageViewModel: ObservableObject {
    var image: Image? = Image("testImage")
    var localFlg = true
    var date: Date = Date()
    let imageModel: ImageModel = ImageModel()
    
    init(date: Date, localFlg: Bool) {
        self.date = date
        self.localFlg = localFlg
        getImage()
    }
    
    func getImagePath() -> String {
        let filePath = imageModel.fileInDocumentsDirectory(date: date)
        return filePath
    }
    
    func getImageName() -> String{
        let imageName = "\(imageModel.stringDate(date: date)).png"
        return imageName
    }
    
    func getImage() {
        if localFlg == true {
            let filePath = getImagePath()
            let image = imageModel.loadImage(path: filePath)
            self.image = image == nil ? nil : Image(uiImage: image!)
            print(filePath)
        }
    }
}
