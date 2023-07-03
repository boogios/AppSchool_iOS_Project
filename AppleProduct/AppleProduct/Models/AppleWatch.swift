//
//  AppleWatch.swift
//  AppleProduct
//
//  Created by 변상우 on 2023/07/03.
//

import Foundation

class AppleWatch: Apple {
    var material: String
    var size: String
    
    init(category: String, name: String, price: Int, color: String, image: String, material: String, size: String) {
        self.material = material
        self.size = size
        
        super.init(category: category, name: name, price: price, color: color, image: image)
    }
}
