//
//  PubMemoListView.swift
//  ShareCoffeeMemo
//
//  Created by nekuro on 2021/10/30.
//

import SwiftUI

struct PubMemoListView: View {
    private let gridItem = [GridItem(.flexible())]
    @State private var showingWriteMemo = false
    @State var searchTextEntered: String = ""
    @StateObject var viewModel = PubMemoListViewModel()
    @State var isInfomation = false
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.memoList.indices, id: \.self) { index in
                    NavigationLink(destination: DeteilMemoView(memo: viewModel.memoList[index], localFlg: false).onDisappear(perform: {
                        setMemo()
                    })) {
                        MemoView(memo: viewModel.memoList[index])
                    }
                }
            }
            .refreshable {
                setMemo()
                print("refresh")
            }
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
        .onAppear() { setMemo() }
    }
    func setMemo() {
        Task {
            do {
                try await viewModel.set()
            } catch {
                
            }
        }
    }
}

struct PubMemoListView_Previews: PreviewProvider {
    static var previews: some View {
        PubMemoListView()
    }
}
