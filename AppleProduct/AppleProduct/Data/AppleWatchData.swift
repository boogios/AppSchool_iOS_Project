//
//  AppleWatchData.swift
//  AppleProduct
//
//  Created by 변상우 on 2023/07/03.
//

import Foundation

let watchSE: AppleWatch = AppleWatch(category: "Apple Watch", name: "Apple Watch SE", price: 359000, color: "미드나이트, 스타라이트, 실버", image: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/watch-card-40-se-202303_GEO_KR?wid=340&hei=264&fmt=png-alpha&.v=1677020555312", material: "알루미늄", size: "40mm, 44mm")

let watch8: AppleWatch = AppleWatch(category: "Apple Watch", name: "Apple Watch Series 8", price: 599000, color: "미드나이트, 스타라이트, 골드, 실버, 그래파이트, 스페이스 블랙, (PRODUCT)RED", image: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/watch-card-40-s8-202303_GEO_KR?wid=340&hei=264&fmt=jpeg&qlt=95&.v=1677020482896", material: "알루미늄, 스테인리스 스틸", size: "41mm, 45mm")

let watchUItra: AppleWatch = AppleWatch(category: "Apple Watch", name: "Apple Watch SE", price: 1149000, color: "미드나이트, 스타라이트, 실버", image: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/watch-card-40-ultra-202209_GEO_KR?wid=340&hei=264&fmt=png-alpha&.v=1678733188783", material: "티타늄", size: "49mm")

let watchHermes: AppleWatch = AppleWatch(category: "Apple Watch", name: "Apple Watch Hermès", price: 1669000, color: "스페이스 블랙, 실버", image: "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/watch-card-40-hermes-202303_GEO_KR?wid=340&hei=264&fmt=jpeg&qlt=95&.v=1677020378387", material: "알루미늄", size: "41mm, 45mm")

let appleWatch: [AppleWatch] = [watchSE, watch8, watchUItra, watchHermes]
