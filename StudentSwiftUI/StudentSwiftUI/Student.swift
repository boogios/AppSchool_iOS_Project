import Foundation

import Foundation

// List에서 Student 데이터 모델을 사용하기 위해서는
// Identifiable 프로토콜을 따라야함
// Identifiable 프로토콜은 개별적으로 구분되어 겹치지 않는 값으로
// id 라는 프로퍼티들을 강제로 요구함
struct Student: Identifiable {
    var id: UUID = UUID() // UUID라고 id를 만들면 자동으로 아이디를 생성해줌
    var number: Int
    var name: String
}

// 직접 데이터를 심어버리는 코딩 - 하드코딩
let students: [Student] = [
    Student(number: 101, name: "KeeN"),
    Student(number: 102, name: "PUJIN"),
    Student(number: 103, name: "iOS"),
    Student(number: 104, name: "Xcode"),
    Student(number: 105, name: "PUJIN"),
    Student(number: 106, name: "KeeN"),
    Student(number: 107, name: "PUJIN"),
    Student(number: 108, name: "KeeN"),
    Student(number: 109, name: "PUJIN"),
    Student(number: 110, name: "KeeN"),
    Student(number: 201, name: "iOS"),
    Student(number: 301, name: "PUJIN"),
    Student(number: 401, name: "KeeN"),
    Student(number: 501, name: "Xcode"),
]

