//
//  PubMemoListModel.swift
//  ShareCoffeeMemo
//
//  Created by nekuro on 2021/10/30.
//

import Foundation

//class PubMemoListModelzzzzz {
//
//    func fetch(completion: @escaping(Result<[PubMemoModel], CoffeeError>) -> Void) {
//        let url = URL(string: "https://caffeinecigarettes.com/getreview")!
//        let request = URLRequest(url: url)
//        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//            if let jsonData = data {
//                if let decodedData: [PubMemoModel] = try? self.jsonDecode(jsonData: jsonData) {
//                    completion(.success(decodedData))
//                    print(decodedData)
//                } else {
//                    completion(.failure(CoffeeError.jsonDecodeError))
//                }
//                } else {
//                    completion(.failure(CoffeeError.coffeeAPIError))
//            }
//        }
//        task.resume()
//    }
//    func post(memo: PubMemoModel, completion: @escaping(Result<Int, CoffeeError>) -> Void) {
//        let url = URL(string: "https://caffeinecigarettes.com/setreview")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        if let jsonData: Data = try? jsonEncode(memo: memo) {
//            request.httpBody = jsonData
//            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//                if let error = error {
//                    print(error.localizedDescription)
//                    completion(.failure(CoffeeError.coffeeAPIError))
//                }
//                if let response = response as? HTTPURLResponse {
//                    completion(.success(response.statusCode))
//                }
//            }
//            task.resume()
//        } else {
//            completion(.failure(CoffeeError.jsonEncodeError))
//            return
//        }
//    }
//    func jsonDecode(jsonData: Data)throws -> [PubMemoModel] {
//        let decoder: JSONDecoder = JSONDecoder()
//        decoder.dateDecodingStrategy = .formatted(.iso8601Short)
//        guard let response: Response = try? decoder.decode(Response.self, from: jsonData) else {
//            throw CoffeeError.jsonDecodeError
//        }
//        let responseBody = response.body.data(using: .utf8)!
//        guard let decodedData: [PubMemoModel] = try? decoder.decode([PubMemoModel].self, from: responseBody) else {
//            throw CoffeeError.jsonDecodeError
//        }
//        return decodedData
//    }
//    func jsonEncode(memo: PubMemoModel)throws -> Data {
//        let encoder: JSONEncoder = JSONEncoder()
//        encoder.dateEncodingStrategy = .formatted(.iso8601Short)
//        guard let jsonData: Data = try? encoder.encode(memo) else {
//            throw CoffeeError.jsonEncodeError
//        }
//        return jsonData
//    }
//}

class PubMemoListModel {
    func httpGET(url: String) async throws -> [PubMemoModel]{
        let url = URL(string: url)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        guard let pubMemoModel = try? jsonDecode(jsonData: data) else {
            throw CoffeeError.jsonDecodeError
        }
        
        return pubMemoModel
    }
    func jsonDecode(jsonData: Data) throws -> [PubMemoModel] {
        let decoder: JSONDecoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.iso8601Short)
        guard let response: Response = try? decoder.decode(Response.self, from: jsonData) else {
            throw CoffeeError.jsonDecodeError
        }
        guard let responseBody = response.body.data(using: .utf8) else {
            throw CoffeeError.jsonDecodeError
        }
        guard let decodedData: [PubMemoModel] = try? decoder.decode([PubMemoModel].self, from: responseBody) else {
            throw CoffeeError.jsonDecodeError
        }
        return decodedData
    }
    
    func httpPOST(memo: PubMemoModel, url: String) async throws {
        let url = URL(string: url)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        guard let jsonData: Data = try? jsonEncode(memo: memo) else {
            throw CoffeeError.jsonEncodeError
        }
        request.httpBody = jsonData
        let (_, response) = try await URLSession.shared.data(for: request)
        if let response = response as? HTTPURLResponse {
            print("response.statusCode = \(response.statusCode)")
            throw CoffeeError.coffeeAPIError
        }
    }
    func jsonEncode(memo: PubMemoModel)throws -> Data{
        let encoder: JSONEncoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(.iso8601Short)
        guard let jsonData: Data = try? encoder.encode(memo) else {
            throw CoffeeError.jsonEncodeError
        }
        return jsonData
    }

}
