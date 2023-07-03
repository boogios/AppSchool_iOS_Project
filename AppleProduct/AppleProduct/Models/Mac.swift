//
//  Mac.swift
//  AppleProduct
//
//  Created by 변상우 on 2023/07/03.
//

import Foundation

class Mac: Apple {
    var usedChip: String
    var batteryUseTime: Int
    var display: Float
    var memory: Int
    var ssd: Int
    var camera: String
    
    init(category: String, name: String, price: Int, color: String, image: String, usedChip: String, batteryUseTime: Int, display: Float, memory: Int, ssd: Int, camera: String) {
        self.usedChip = usedChip
        self.batteryUseTime = batteryUseTime
        self.display = display
        self.memory = memory
        self.ssd = ssd
        self.camera = camera
        
        super.init(category: category, name: name, price: price, color: color, image: image)
    }
}
