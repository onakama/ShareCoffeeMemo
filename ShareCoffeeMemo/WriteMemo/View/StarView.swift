//
//  StarView.swift
//  ShareCoffeeMemo
//
//  Created by nekuro on 2021/10/26.
//

import SwiftUI

struct StarView: View {
    @StateObject var astViewModel: StarViewModel = StarViewModel()
    @StateObject var roastViewModel: StarViewModel = StarViewModel()
    @StateObject var tasteViewModel: StarViewModel = StarViewModel()
    var body: some View {
        VStack{
            Text("テイスト").font(.caption2)
            HStack{
                Text("酸")
                ForEach($astViewModel.stars.indices, id: \.self) { starIndex in
                    Button(action: {
                        astViewModel.tap(starIndex: starIndex)
                    }) {
                        Text(astViewModel.stars[starIndex] ? "★": "☆")
                    }
                }
                .font(.title)
                .foregroundColor(Color.yellow)
                Text("苦")
            }
            .padding(.bottom)
            Text("ボディ").font(.caption2)
            HStack{
                Text("軽")
                ForEach($tasteViewModel.stars.indices, id: \.self) { starIndex in
                    Button(action: {
                        tasteViewModel.tap(starIndex: starIndex)
                    }) {
                        Text(tasteViewModel.stars[starIndex] ? "★": "☆")
                    }
                }
                .font(.title)
                .foregroundColor(Color.yellow)
                Text("重")
            }
            .padding(.bottom)
            Text("ロースト").font(.caption2)
            HStack{
                Text("浅")
                ForEach($roastViewModel.stars.indices, id: \.self) { starIndex in
                    Button(action: {
                        roastViewModel.tap(starIndex: starIndex)
                    }) {
                        Text(roastViewModel.stars[starIndex] ? "★": "☆")
                    }
                }
                .font(.title)
                .foregroundColor(Color.yellow)
                Text("深")
            }
            .padding(.bottom)
        }
    }
}

struct StarView_Previews: PreviewProvider {
    static var previews: some View {
        StarView()
    }
}
