//
//  PubMemoListViewModel.swift
//  ShareCoffeeMemo
//
//  Created by nekuro on 2021/10/30.
//

import Foundation

class PubMemoListViewModel: ObservableObject {
    @Published var memoList: [MemoModel] = []
    init() {
        set()
    }
    func set() {
        let memoListModel: PubMemoListModel = PubMemoListModel()
        self.memoList = memoListModel.get()
    }
}
