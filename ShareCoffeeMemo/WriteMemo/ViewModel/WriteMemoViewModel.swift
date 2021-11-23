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
        memo.name = self.coffeeName
        memo.saler = self.saler
        memo.taste = taste
        memo.body = body
        memo.roast = roast
        memo.review = coffeeReview
        MemoListModel.shared.set(memo: memo)
    }
}
