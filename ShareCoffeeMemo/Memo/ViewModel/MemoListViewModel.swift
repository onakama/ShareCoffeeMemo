//
//  MemoListViewModel.swift
//  ShareCoffeeMemo
//
//  Created by nekuro on 2021/10/26.
//

import Foundation

class MemoListViewModel: ObservableObject {
    @Published var memoList: [MemoModel] = []
    init() {
        set()
    }
    func set() {
        self.memoList = MemoListModel.shared.get()
    }
    func remove(offset: IndexSet) {
        let id = memoList[offset.last!].id
        do {
            self.memoList = []
            MemoListModel.shared.delete(id: id)
            set()
        }
        MemoListModel.shared.delete(id: id)
        
    }
}
