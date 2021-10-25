//
//  DeteilMemoViewModel.swift
//  ShareCoffeeMemo
//
//  Created by nekuro on 2021/10/26.
//

import Foundation

class DeteilMemoViewModel: ObservableObject {
    var memo: MemoModel
    @Published var review: String
    @Published var oldReview: String
    init(memo: MemoModel) {
        self.memo = memo
        self.review = memo.review
        self.oldReview = memo.review
    }
    func updateReview() {
        MemoListModel.shared.updateReview(id: memo.id, review: review)
        oldReview = review
    }
}
