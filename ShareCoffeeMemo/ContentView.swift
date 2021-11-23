//
//  ContentView.swift
//  ShareCoffeeMemo
//
//  Created by nekuro on 2021/10/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            MemoListView()
                .tabItem {
                    Image(systemName: "person.fill")
                }
            PubMemoListView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
