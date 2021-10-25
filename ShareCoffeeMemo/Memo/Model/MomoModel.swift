//
//  MomoModel.swift
//  ShareCoffeeMemo
//
//  Created by nekuro on 2021/10/26.
//

import Foundation
import RealmSwift

protocol MemoProtocol {
    var id: Int { set get }
    var name: String { set get }
    var saler: String { set get }
    var astringency: Int { set get }
    var taste: Int { set get }
    var roast: Int { set get }
    var date: Date { set get }
}

class MemoModel: Object, MemoProtocol, Identifiable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var saler: String = ""
    @objc dynamic var astringency: Int = 0
    @objc dynamic var taste: Int = 0
    @objc dynamic var roast: Int = 0
    @objc dynamic var review: String = ""
    @objc dynamic var date: Date = Date()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
