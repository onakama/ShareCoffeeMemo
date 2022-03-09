//
//  MemoListView.swift
//  ShareCoffeeMemo
//
//  Created by nekuro on 2021/10/26.
//

import SwiftUI

struct MemoListView: View {
    private let gridItem = [GridItem(.flexible())]
    @State private var showingWriteMemo = false
    @State var searchTextEntered: String = ""
    @StateObject var viewModel = MemoListViewModel()
    @State var isInfomation = false
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults.reversed()) { MemoModel in
                    NavigationLink(destination: DeteilMemoView(memo: MemoModel, localFlg: true).onDisappear(perform: {
                        viewModel.set()
                    })) {
                        MemoView(memo: MemoModel)
                    }
                }
                .onDelete(perform: viewModel.remove)
            }
            .searchable(text: $searchTextEntered)
            .navigationTitle("Coffee Book")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    WriteMemoButtonView()
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: Information(), isActive: $isInfomation) {
                        InformationButtonView()
                    }
                }
                
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    var searchResults: [MemoModel] {
            if searchTextEntered.isEmpty {
                return viewModel.memoList
            } else {
                return viewModel.memoList.filter { $0.name.contains(searchTextEntered) }
            }
        }
}

struct MemoListView_Previews: PreviewProvider {
    static var previews: some View {
        MemoListView()
    }
}
