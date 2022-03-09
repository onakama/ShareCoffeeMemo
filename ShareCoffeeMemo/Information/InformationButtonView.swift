//
//  InformationButtonView.swift
//  ShareCoffeeMemo
//
//  Created by 住山大誠 on 2022/03/10.
//

import SwiftUI

struct InformationButtonView: View {
    var body: some View {
        Image("gear")
            .resizable()
            .frame(width: 25, height: 25)
    }
}

struct InformationButtonView_Previews: PreviewProvider {
    static var previews: some View {
        InformationButtonView()
    }
}
