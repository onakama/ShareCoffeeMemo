//
//  StarViewModel.swift
//  ShareCoffeeMemo
//
//  Created by nekuro on 2021/10/26.
//

import Foundation
import CoreImage
class StarViewModel: ObservableObject {
    @Published var stars: [Bool] = [false, false, false, false, false]
    func tap(starIndex: Int) {
        switch stars[starIndex] {
        case true:
            crean()
        case false:
            crean()
            for i in 0 ... starIndex {
                stars[i] = true
            }
        }
    }
    func crean(){
        self.stars = [false, false, false, false, false]
    }
    func get() -> Int{
        var array: [Bool] = []
        for i in self.stars {
            if i == true {
                array.append(i)
            } else {
                break
            }
        }
        return array.count
    }
    
    
}
