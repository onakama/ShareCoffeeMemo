//
//  WriteMemoViewModel.swift
//  ShareCoffeeMemo
//
//  Created by nekuro on 2021/10/26.
//

import Foundation
class WriteMemoViewModel: ObservableObject {
    @Published var coffeeName = ""
    @Published var saler = ""
    @Published var coffeeReview = ""
    func makeMemo(taste: Int, body: Int,  roast: Int){
        let memo: MemoModel = MemoModel()
        let pubMemo: PubMemoModel = PubMemoModel()
        memo.name = self.coffeeName
        memo.saler = self.saler
        memo.taste = taste
        memo.body = body
        memo.roast = roast
        memo.review = coffeeReview
        pubMemo.name = self.coffeeName
        pubMemo.saler = self.saler
        pubMemo.taste = taste
        pubMemo.body = body
        pubMemo.roast = roast
        pubMemo.review = coffeeReview
        write(memo: memo)
        post(memo: pubMemo)
    }
    func write(memo: MemoModel) {
        MemoListModel.shared.set(memo: memo)
    }
    func post(memo: PubMemoModel) {
        DispatchQueue.global().async {
            let memoModel: PubMemoListModel = PubMemoListModel()
            memoModel.post(memo: memo, completion: { result in
                switch result {
                case .success(let response):
                    print("HTTP POSTリクエスト：\(response)")
                case .failure(let error):
                    print(error)
                }
            })
        }
    }
}
