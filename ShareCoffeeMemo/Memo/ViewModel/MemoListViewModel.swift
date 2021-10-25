//
//  MemoListViewModel.swift
//  ShareCoffeeMemo
//
//  Created by nekuro on 2021/10/26.
//

import Foundation

class MemoListViewModel: ObservableObject {
    @Published var memoList: [MemoModel] = []
    //@Published var sortList: SortType
    init(){
        set()
    }
    func setStar(StarInt: Int) -> String{
        var stars: [String] = ["☆","☆","☆","☆","☆"]
        for i in 0 ..< StarInt{
            stars[i] = "★"
        }
        return stars.joined()
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
enum SortType {
    //昇順
    case ascending
    //降順
    case descending
}
