//
//  IPhone.swift
//  AppleProduct
//
//  Created by 변상우 on 2023/07/03.
//

import Foundation

class IPhone: Apple {
    
    override init(category: String, name: String, price: Int, color: String, image: String) {
        super.init(category: category, name: name, price: price, color: color, image: image)
    }
}
