//
//  Inquiry.swift
//  ShareCoffeeMemo
//
//  Created by nekuro on 2021/10/26.
//

import SwiftUI

struct Inquiry: View {
    var body: some View {
        Group{
            VStack(alignment: .leading){
                Text("お問い合わせ")
                .font(.title)
                .padding()

                Text("1.Mail")
                Text(" 　メールはonakama.dev@gmail.com")
                Text("2.Twitter")
                Link("   Twitter(@Dev.onakama)", destination: URL(string: "https://twitter.com/DevOnakama")!)
            }
        }
        .padding(.bottom, 300)
    }
}

struct Inquiry_Previews: PreviewProvider {
    static var previews: some View {
        Inquiry()
    }
}
