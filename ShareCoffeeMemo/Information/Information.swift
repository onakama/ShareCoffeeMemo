//
//  Information.swift
//  ShareCoffeeMemo
//
//  Created by nekuro on 2021/10/26.
//

import SwiftUI

struct Information: View {
    var body: some View {
        List {
            NavigationLink(destination: PrivacyPolicy()) {
                Text("プライバシーポリシー")
                    .foregroundColor(Color("TextColor"))
            }
            NavigationLink(destination: Inquiry()) {
                Text("お問い合わせ")
                    .foregroundColor(Color("TextColor"))
            }
        }
        .navigationTitle("Infomation")
    }
}


struct Information_Previews: PreviewProvider {
    static var previews: some View {
        Information()
    }
}
