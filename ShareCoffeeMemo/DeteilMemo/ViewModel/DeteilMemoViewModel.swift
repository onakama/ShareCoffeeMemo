//
//  DeteilMemoViewModel.swift
//  ShareCoffeeMemo
//
//  Created by nekuro on 2021/10/26.
//

import Foundation
import UIKit

class DeteilMemoViewModel: ObservableObject {
    var memo: MemoProtocol
    @Published var review: String
    @Published var oldReview: String
    @Published var image: UIImage?
    let localMemoFlg: Bool
    init(memo: MemoProtocol, localFlg: Bool) {
        self.memo = memo
        self.review = memo.review
        self.oldReview = memo.review
        self.localMemoFlg = localFlg
        getImage()
    }
    func getImage() {
        let imageModel: ImageModel = ImageModel()
        let filePath = imageModel.fileInDocumentsDirectory(date: memo.date)
        self.image = imageModel.loadImage(path: filePath)
        print(filePath)
    }
    func updateReview() {
        if localMemoFlg == true {
            MemoListModel.shared.updateReview(id: memo.id, review: review)
            oldReview = review
        }
    }
}
