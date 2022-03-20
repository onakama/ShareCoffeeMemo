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
    let localFlg: Bool
    init(memo: MemoProtocol, localFlg: Bool) {
        self.memo = memo
        self.review = memo.review
        self.oldReview = memo.review
        self.localFlg = localFlg
    }
    func updateReview() {
        if localFlg == true {
            MemoListModel.shared.updateReview(id: memo.id, review: review)
            oldReview = review
        }
    }
}
