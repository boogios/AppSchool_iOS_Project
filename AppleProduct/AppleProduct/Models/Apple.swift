//
//  Apple.swift
//  AppleProduct
//
//  Created by 변상우 on 2023/07/03.
//

import Foundation

class Apple: Identifiable {
    var id: UUID = UUID()
    
    var category: String // 카테고리: 맥북, 아이폰, 아이패드, 애플워치, 에어팟
    var name: String // 모델명: 맥북프로, 아이폰15프로 등
    var price: Int // 가격: 3,500,000만원 등
    var color: String // 색상
    var image: String // 이미지
    
    var imageString: URL? {
        return URL(string: image)
    }
    
    init(category: String, name: String, price: Int, color: String, image: String) {
        self.category = category
        self.name = name
        self.price = price
        self.color = color
        self.image = image
    }
}
