//
//  MemoImageView.swift
//  ShareCoffeeMemo
//
//  Created by 住山大誠 on 2022/03/12.
//

import SwiftUI

struct MemoImageView: View {
    var viewModel: MemoImageViewModel
    init(date: Date, localFlg: Bool) {
        viewModel = MemoImageViewModel(date: date, localFlg: localFlg)
    }
    var body: some View {
        VStack {
            if viewModel.localFlg == false {
                AsyncImage(url: URL(string: "https://caffeinecigarettes.com/getimage?filename=\(viewModel.getImageName())")) { phase in
                    if let image = phase.image {
                        image.resizable().scaledToFit()
                    } else {
                        ProgressView()
                    }
                }
            } else {
                if viewModel.image != nil {
                    viewModel.image!
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                }
            }
        }
    }
}

struct MemoImageView_Previews: PreviewProvider {
    static var previews: some View {
        MemoImageView(date: Date(), localFlg: false)
    }
}
