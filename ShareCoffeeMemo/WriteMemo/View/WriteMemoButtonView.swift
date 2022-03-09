//
//  WriteMemoButtonView.swift
//  ShareCoffeeMemo
//
//  Created by 住山大誠 on 2022/03/10.
//

import SwiftUI

struct WriteMemoButtonView: View {
    @State private var showingWriteMemo = false
    
    var body: some View {
        Button(action: {
            self.showingWriteMemo = true
        }) {
            Image(systemName: "square.and.pencil")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(Color("TextColor"))
        }
        .sheet(isPresented: $showingWriteMemo) {
            WriteMemoView()
        }
    }
}

struct WriteMemoButtonView_Previews: PreviewProvider {
    static var previews: some View {
        WriteMemoButtonView()
    }
}
