//
//  MacData.swift
//  AppleProduct
//
//  Created by 변상우 on 2023/07/03.
//

import Foundation

let macBookAir13: Mac = Mac(category: "MacBook", name: "MacBook Air 13", price: 100000, color: "Black", image: "https://www.apple.com/v/macbook-pro-13/p/images/overview/compare/compare_mba_m2__evplaf30ej6u_large.png", usedChip: "M2", batteryUseTime: 18, display: 34.5, memory: 24, ssd: 2, camera: "1080p FaceTime HD")

let macBookPro13: Mac = Mac(category: "MacBook", name: "MacBook Pro 13", price: 100000, color: "Black", image: "https://www.apple.com/v/macbook-pro-13/p/images/overview/compare/compare_mbp_13__givmvd62t5ua_large.png", usedChip: "M2", batteryUseTime: 20, display: 33.7, memory: 24, ssd: 2, camera: "720p FaceTime HD")

let macBookPro14: Mac = Mac(category: "MacBook", name: "MacBook Pro 14", price: 100000, color: "Black", image: "https://www.apple.com/v/macbook-pro-13/p/images/overview/compare/compare_mbp_14_16__eqw16nwkegia_large.png", usedChip: "M2 Pro // M2 Max", batteryUseTime: 18, display: 35.9, memory: 96, ssd: 8, camera: "1080p FaceTime HD")

let macBookPro16: Mac = Mac(category: "MacBook", name: "MacBook Pro 16", price: 100000, color: "Black", image: "https://www.apple.com/v/macbook-pro-13/p/images/overview/compare/compare_mbp_14_16__eqw16nwkegia_large.png", usedChip: "M2 Pro // M2 Max", batteryUseTime: 22, display: 41.0, memory: 96, ssd: 8, camera: "1080p FaceTime HD")

let macBook: [Mac] = [macBookAir13, macBookPro13, macBookPro14, macBookPro16]
