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
//        let pubMemo: PubMemoModel = PubMemoModel()
        memo.name = self.coffeeName
        memo.saler = self.saler
        memo.taste = taste
        memo.body = body
        memo.roast = roast
        memo.review = coffeeReview
        memo.date = Date()
//        pubMemo.name = self.coffeeName
//        pubMemo.saler = self.saler
//        pubMemo.taste = taste
//        pubMemo.body = body
//        pubMemo.roast = roast
//        pubMemo.review = coffeeReview
        return memo
    }
    func write(memo: MemoModel) {
        let imageModel: ImageModel = ImageModel()
        let imagePath = imageModel.fileInDocumentsDirectory(date: memo.date)
        if imageModel.saveImage(image: photo!, path: imagePath) == true { print("できた！！！！！") }
        MemoListModel.shared.set(memo: memo)
    }
    func post(memo: MemoModel) async throws {
        let memoModel: PubMemoListModel = PubMemoListModel()
        do {
            try await memoModel.httpPOST(memo: memo, url: "https://caffeinecigarettes.com/setreview")
        } catch {
            
        }
    }
}
