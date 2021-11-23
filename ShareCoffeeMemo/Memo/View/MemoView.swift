//
//  MemoView.swift
//  ShareCoffeeMemo
//
//  Created by nekuro on 2021/10/26.
//

import SwiftUI

struct MemoView: View {
    var viewModel: MemoViewModel
    init(memo: MemoProtocol){
        self.viewModel = MemoViewModel(memo: memo)
    }
    var body: some View {
        VStack{
            HStack{
                Text(viewModel.memo.name)
                    .font(.system(.title, design: .rounded))
                    .font(.title)
                    .foregroundColor(Color("TextColor"))
                Spacer()
            }
            HStack{
                Spacer()
                Text(viewModel.memo.saler)
                    .italic()
                    .foregroundColor(Color("TextColor"))
            }
            HStack{
                Text("酸")
                    .foregroundColor(Color("TextColor"))
                Text(viewModel.setStar(viewModel.memo.taste))
                    .foregroundColor(Color.yellow)
                Text("苦")
                    .foregroundColor(Color("TextColor"))
                Spacer()
            }
            .padding(.leading)
            HStack{
                Text("軽")
                    .foregroundColor(Color("TextColor"))
                Text(viewModel.setStar(viewModel.memo.body))
                    .foregroundColor(Color.yellow)
                Text("重")
                    .foregroundColor(Color("TextColor"))
                Spacer()
            }
            .padding(.leading)
            HStack{
                Text("浅")
                    .foregroundColor(Color("TextColor"))
                Text(viewModel.setStar(viewModel.memo.roast))
                    .foregroundColor(Color.yellow)
                Text("深")
                    .foregroundColor(Color("TextColor"))
                Spacer()
            }
            .padding(.leading)
            HStack{
                Spacer()
                Text(viewModel.memo.date, style: .date)
                    .underline()
                    .foregroundColor(Color("TextColor"))
            }
        }
    }
}

struct MemoView_Previews: PreviewProvider {
    static var previews: some View {
       let memo = MemoModel()
       MemoView(memo: memo)
   }
}
