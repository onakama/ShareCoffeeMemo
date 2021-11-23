//
//  PubMemoListModel.swift
//  ShareCoffeeMemo
//
//  Created by nekuro on 2021/10/30.
//

import Foundation

class PubMemoListModel {
    private var memoList: [MemoModel] = []
    
    func fetch(completion: @escaping(Result<[PubMemoModel], CoffeeError>) -> Void) {
        let url = URL(string: "https://caffeinecigarettes.com/getreview")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let jsonData = data {
                if let decodedData: [PubMemoModel] = try? self.jsonDecode(jsonData: jsonData) {
                    completion(.success(decodedData))
                } else {
                    completion(.failure(CoffeeError.jsonDecodeError))
                }
                } else {
                    completion(.failure(CoffeeError.coffeeAPIError))
            }
        }
        task.resume()
    }
    
    func jsonDecode(jsonData: Data)throws -> [PubMemoModel] {
        let decoder: JSONDecoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.iso8601Shrt)
        guard let response: Response = try? decoder.decode(Response.self, from: jsonData) else {
            throw CoffeeError.jsonDecodeError
        }
        let responseBody = response.body.data(using: .utf8)!
        guard let decodedData: [PubMemoModel] = try? decoder.decode([PubMemoModel].self, from: responseBody) else {
            throw CoffeeError.jsonDecodeError
        }
        return decodedData
    }
    
    
    func getForHttps() {
        let url = URL(string: "https://caffeinecigarettes.com/getreview")!
        let request = URLRequest(url: url)
        let decoder: JSONDecoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.iso8601Shrt)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let jsonData = data else {
                print("URL error")
                return
            }
            do {
                let res = try decoder.decode(Response.self, from: jsonData)
                let resBody = res.body.data(using: .utf8)!
                let response = try! decoder.decode([MemoModel].self, from: resBody)
                print(response)
                self.memoList = response
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }
    func get() -> [MemoModel] {
        return self.memoList
    }
}
