//
//  CoffeeError.swift
//  ShareCoffeeMemo
//
//  Created by 住山大誠 on 2021/11/21.
//

import Foundation

enum CoffeeError: Error {
    case coffeeAPIError
    case jsonDecodeError
    case jsonEncodeError
}
