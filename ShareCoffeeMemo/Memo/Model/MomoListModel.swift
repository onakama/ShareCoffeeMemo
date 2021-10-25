//
//  MomoListModel.swift
//  ShareCoffeeMemo
//
//  Created by nekuro on 2021/10/26.
//

import Foundation
import RealmSwift

class MemoListModel {
    private var memoList: [MemoModel] = []
    static let shared = MemoListModel()
    let realm = try! Realm()
    var realmCount = 0
    private init(){
        //allDelete()
    }
    func get() -> [MemoModel] {
        let memo1 = realm.objects(MemoModel.self)
        memoList = []
        memoList += memo1
        self.realmCount = memoList.count
        return memoList
    }
    func set(memo: MemoModel) {
        memo.id = self.realmCount
        try! realm.write {
            realm.add(memo, update: .modified)
        }
        self.realmCount += 1
    }
    func delete(id: Int) {
          try! realm.write {
              let target = realm.objects(MemoModel.self).filter("id == \(id)")
              realm.delete(target)
          }
    }
    func updateReview(id: Int, review: String) {
        try! realm.write {
            let target = realm.objects(MemoModel.self).filter("id == \(id)")
            target[0].review = review
        }
    }
    func allDelete() {
        try! realm.write {
            realm.deleteAll()
        }
    }
}
