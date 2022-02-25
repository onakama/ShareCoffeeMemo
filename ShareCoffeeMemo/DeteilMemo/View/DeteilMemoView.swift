//
//  DeteilMemoView.swift
//  ShareCoffeeMemo
//
//  Created by nekuro on 2021/10/26.
//

import SwiftUI
import RealmSwift

struct DeteilMemoView: View {
    @ObservedObject var viewModel: DeteilMemoViewModel
    init(memo: MemoProtocol, localFlg: Bool) {
        self.viewModel = DeteilMemoViewModel(memo: memo, localFlg: localFlg)
    }
    var body: some View {
        VStack {
            Image("testImage")
                .resizable()
                .scaledToFit()
                .frame(width: 300.0, height: 200.0)
            GeometryReader { geometry in
                VStack {
                    MemoView(memo: viewModel.memo)
                        //.padding(.top, 80)
                        .frame(width: geometry.size.width / 1.1)
                    HStack {
                        Text("Memo")
                            .font(.title)
                            .padding(.leading)
                        Spacer()
                        Button(action: {
                            viewModel.updateReview()
                        }) {
                            Text("+")
                                .padding(.trailing, 50)
                                .font(.title)
                                .foregroundColor(buttonColor)
                        }
                    }
                    .padding(.top, 10)
                    List {
                        TextEditor(text: $viewModel.review)
                            .lineLimit(nil)
                            .frame(height: 200)
                    }
                }
            }
        }
    }
    var buttonColor: Color {
        if viewModel.review != viewModel.oldReview {
            return Color.blue
        } else {
            return Color.gray
        }
    }
}
struct DeteilMemoView_Previews: PreviewProvider {
    static var previews: some View {
        let memo = MemoModel()
        DeteilMemoView(memo: memo, localFlg: true)
    }
}
