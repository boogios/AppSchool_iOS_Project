//
//  IPad.swift
//  AppleProduct
//
//  Created by 변상우 on 2023/07/03.
//

import Foundation

class IPad: Apple {
    var displaySize: Double // 디스플레이 크기 - 11형, 12.9형 디스플레이
    var storage: Int // 저장용량 - 단위 GB
    
    init(category: String, name: String, price: Int, color: String, image: String, displaySize: Double, storage: Int) {
        
        self.displaySize = displaySize
        self.storage = storage
        
        super.init(category: category, name: name, price: price, color: color, image: image)
    }
}

