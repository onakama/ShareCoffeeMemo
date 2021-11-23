//
//  PubMemoListViewModel.swift
//  ShareCoffeeMemo
//
//  Created by nekuro on 2021/10/30.
//

import Foundation

class PubMemoListViewModel: ObservableObject {
    @Published var memoList: [PubMemoModel] = []
    var memoListModel: PubMemoListModel = PubMemoListModel()
    init() {
        set()
    }
    func set() {
        memoListModel.getForHttps()
        
        DispatchQueue.global().async {
            let memoModel: PubMemoListModel = PubMemoListModel()
            memoModel.fetch(completion: { result in
                DispatchQueue.main.async {
                    self.changeMemo(result: result)
                }
            })
        }
    }
    func changeMemo(result: Result<[PubMemoModel], CoffeeError>) {
        switch result {
        case .success(let response):
            self.memoList = response
            print(memoList)
        case .failure(let error):
            print(error)
        }
    }
}
