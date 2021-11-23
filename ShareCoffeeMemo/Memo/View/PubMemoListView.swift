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
    @State var isInformation = false
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.memoList.indices, id: \.self) { index in
                    NavigationLink(destination: DeteilMemoView(memo: viewModel.memoList[index], localFlg: false).onDisappear(perform: {
                        viewModel.set()
                    })) {
                        MemoView(memo: viewModel.memoList[index])
                    }
                }
            }
            
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

}

struct PubMemoListView_Previews: PreviewProvider {
    static var previews: some View {
        PubMemoListView()
    }
}
