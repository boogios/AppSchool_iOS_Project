//
//  AirPods.swift
//  AppleProduct
//
//  Created by 변상우 on 2023/07/03.
//

import Foundation

class AirPods: Apple {
    var series: String
    
    init(category: String, name: String, price: Int, color: String, series: String, image: String) {
        
        self.series = series
        
        super.init(category: category, name: name, price: price, color: color, image: image)
    }
}
