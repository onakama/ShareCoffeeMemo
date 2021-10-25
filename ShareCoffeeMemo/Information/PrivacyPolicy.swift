//
//  PrivacyPolicy.swift
//  ShareCoffeeMemo
//
//  Created by nekuro on 2021/10/26.
//

import SwiftUI

struct PrivacyPolicy: View {
    var body: some View {
        Group{
        VStack(alignment: .leading){
            Text("プライバシーポリシー")
            .font(.title)
            .padding()
            Text("1.個人情報について")
            Text(" 本アプリでは、第三者に個人を特定できる情報を提供することはございません。")
                .padding()
            Text("2.サポート")
            Text(" 問題解決のためにメールを送信いたしますが、個人を特定できる情報は一切送信されません。")
                .padding()
            Text("3.データ解析")
            Text(" アプリの利便性向上のため、匿名で個人を特定できない範囲で最新の注意を払い、アクセス解析をしております。")
                .padding()
            Text("4.免責事項")
            Text(" 利用上の不具合・不都合に対して可能な限りサポートを行っておりますが、利用者が本アプリを利用して生じた損害に関して、開発元は責任を負わないものとします。")
                .padding()
            }
        }
    }
}


struct PrivacyPolicy_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicy()
    }
}
