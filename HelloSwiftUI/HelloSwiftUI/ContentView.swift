import SwiftUI

struct ContentView: View {
    
    let name: String = "KeeN"
    
    var body: some View {
        // VStack 안의 View들은
        // 위 아래 순서로 쌓여감
        // V: Vertical, H: Horizontal
        VStack {
            Spacer()
            // VStack 안의 View들은
            // 왼쪽에서 오른쪽 순서로 쌓여감
            // V: Vertical, H: Horizontal
            HStack {
                Text("Good")
                Text("JOB~!")
                Spacer()
                Text(name)
            }
            .font(.largeTitle)
            .padding()
            
            Spacer()
            
            // Stack 내부의 View들이 포함되는 경우에는
            // 10개 넘게 포함될 수 없음
            // 많이 사용하기 위해 Group으로 묶어줌
            Group {
                Text("Hello KeeN!!")
                    .font(.largeTitle)
                Text("Hello KeeN")
                Text("Hello KeeN")
                Text("Hello KeeN")
                Text("Hello KeeN")
                
                Group {
                    Text("Hello KeeN!!")
                        .font(.largeTitle)
                    Text("Hello KeeN")
                    Text("Hello KeeN")
                    Text("Hello KeeN")
                    Text("Hello KeeN")
                }
            }
            
            Spacer()
        }
        .bold()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
