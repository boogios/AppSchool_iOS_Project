//
//  IPadData.swift
//  AppleProduct
//
//  Created by 변상우 on 2023/07/03.
//

import Foundation

let iPadPro: IPad = IPad(category: "iPad", name: "iPad Pro", price: 1249000, color: "스페이스 그레이, 실버", image: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/ipad-card-40-pro-202210?wid=680&hei=528&fmt=p-jpg&qlt=95&.v=1664578794100" , displaySize: 27.9, storage: 128)

let iPadAir: IPad = IPad(category: "iPad", name: "iPad Air", price: 929000, color: "스페이스 그레이, 블루, 핑크, 퍼플, 스타라이트", image: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/ipad-comp-air-202210?wid=338&hei=386&fmt=jpeg&qlt=90&.v=1664411153129" , displaySize: 27.5, storage: 64)

let iPad10th: IPad = IPad(category: "iPad", name: "iPad 10th", price: 679000, color: "블루, 핑크, 옐로, 실버", image: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/ipad-comp-10thgen-202210?wid=338&hei=386&fmt=jpeg&qlt=90&.v=1664411152951" , displaySize: 27.5, storage: 64)

let iPad9th: IPad = IPad(category: "iPad", name: "iPad 9th", price: 499000, color: "스페이스 그레이, 실버", image: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/ipad-comp-9thgen-202210?wid=338&hei=386&fmt=jpeg&qlt=90&.v=1664411153121" , displaySize: 25.9, storage: 64)

let iPadmini: IPad = IPad(category: "iPad", name: "iPad mini", price: 499000, color: "스페이스 그레이, 핑크, 퍼플, 스타라이트", image: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/ipad-comp-mini-202210?wid=338&hei=386&fmt=jpeg&qlt=90&.v=1664411153122" , displaySize: 21, storage: 64)

let iPad: [IPad] = [iPadPro, iPadAir, iPad10th, iPad9th, iPadmini]
