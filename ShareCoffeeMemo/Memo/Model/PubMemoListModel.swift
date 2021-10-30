//
//  PubMemoListModel.swift
//  ShareCoffeeMemo
//
//  Created by nekuro on 2021/10/30.
//

import Foundation

class PubMemoListModel {
    func get() -> [MemoModel] {
        let decoder: JSONDecoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        let responce = try! decoder.decode(ResponceMemos.self, from: jsonStr.data(using: .utf8)!)
        return responce.memos
    }
}
