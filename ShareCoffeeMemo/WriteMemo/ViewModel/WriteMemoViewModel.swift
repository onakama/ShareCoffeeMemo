//
//  WriteMemoViewModel.swift
//  ShareCoffeeMemo
//
//  Created by nekuro on 2021/10/26.
//

import Foundation
import SwiftUI
class WriteMemoViewModel: ObservableObject {
    @Published var coffeeName = ""
    @Published var saler = ""
    @Published var coffeeReview = ""
    @Published var photo: UIImage?
    func makeMemo(taste: Int, body: Int,  roast: Int) -> MemoModel{
        let memo: MemoModel = MemoModel()
        memo.name = self.coffeeName
        memo.saler = self.saler
        memo.taste = taste
        memo.body = body
        memo.roast = roast
        memo.review = coffeeReview
        memo.date = Date()
        return memo
    }
    func write(memo: MemoModel) {
        MemoListModel.shared.set(memo: memo)
        if self.photo != nil {
            let imageModel: ImageModel = ImageModel()
            let imagePath = imageModel.fileInDocumentsDirectory(date: memo.date)
            if imageModel.saveImage(image: photo!, path: imagePath) == true { print("ローカル保存できた！！！！！") }
        }
        
    }
    func post(memo: MemoModel) async throws {
        let memoModel: PubMemoListModel = PubMemoListModel()
        if self.photo != nil {
            let imageModel: ImageModel = ImageModel()
            let imageName = imageModel.stringDate(date: memo.date)
            //imageModel.uploadImage(image: photo!, path: "\(imageName).png")
        }
        do {
            try await memoModel.httpPOST(memo: memo, url: "https://caffeinecigarettes.com/setreview")
            
        } catch {
            
        }
    }
}
