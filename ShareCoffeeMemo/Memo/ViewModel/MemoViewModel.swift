//
//  MemoViewModel.swift
//  ShareCoffeeMemo
//
//  Created by nekuro on 2021/10/26.
//

import Foundation

class MemoViewModel {
    var memo: MemoProtocol
    init(memo: MemoProtocol){
        self.memo = memo
    }
    func setStar(_ StarInt: Int) -> String{
        var stars: [String] = ["☆","☆","☆","☆","☆"]
        for i in 0 ..< StarInt{
            stars[i] = "★"
        }
        return stars.joined()
    }
}
