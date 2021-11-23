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
    @State var isInformation = false
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
                    Button(action: {
                        self.showingWriteMemo = true
                    }) {
                        Text("+")
                            .font(.title)
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: Information(), isActive: $isInformation) {
                        Image("gear")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                }
                
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: $showingWriteMemo, onDismiss: {
            viewModel.set()
        }) {
            WriteMemoView()
        }
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
