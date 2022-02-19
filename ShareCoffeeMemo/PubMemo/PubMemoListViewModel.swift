//
//  PubMemoListViewModel.swift
//  ShareCoffeeMemo
//
//  Created by nekuro on 2021/10/30.
//

import Foundation

actor PubMemoListViewModel: ObservableObject {
    @MainActor @Published var memoList: [PubMemoModel] = []
    var memoListModel: PubMemoListModel = PubMemoListModel()
    func set() async throws {
        do {
            let memo = try await  memoListModel.httpGET(url: "https://caffeinecigarettes.com/getreview")
            await MainActor.run { [weak self] in
                self?.memoList = memo
            }
        } catch {
            throw CoffeeError.coffeeAPIError
        }

    }

}
