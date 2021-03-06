//
//  MomoModel.swift
//  ShareCoffeeMemo
//
//  Created by nekuro on 2021/10/26.
//

import Foundation
import RealmSwift

extension DateFormatter {
    static let iso8601Short: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}

struct Response: Decodable {
    let statusCode: Int
    let body: String
}

protocol MemoProtocol {
    var id: Int { set get }
    var name: String { set get }
    var saler: String { set get }
    var taste: Int { set get }
    var body: Int { set get }
    var roast: Int { set get }
    var review: String { set get }
    var date: Date { set get }
}

class MemoModel: Object, MemoProtocol, Identifiable, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var saler: String = ""
    @objc dynamic var taste: Int = 0
    @objc dynamic var body: Int = 0
    @objc dynamic var roast: Int = 0
    @objc dynamic var review: String = ""
    @objc dynamic var date: Date = Date()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
//
//class PubMemoModel: Codable, MemoProtocol, Identifiable {
//    var id: Int = 0
//    var name: String = ""
//    var saler: String = ""
//    var taste: Int = 0
//    var body: Int = 0
//    var roast: Int = 0
//    var review: String = ""
//    var date: Date = Date()
//}
//

