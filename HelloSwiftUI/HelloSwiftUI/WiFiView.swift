import SwiftUI

struct WiFiView: View {
    
    // 1. wifiEnable은 @State로 설정해줌
    // 이 내용이 바뀌면 body가 새로 그려질거라고 SwiftUI에 알려줌
    @State var wifiEnable: Bool = false
    
    // 3. Toggle 스위치를 누르면 wifiEnable 값이 변경되고
    // 알아서 body 전체를 다시 그려서 보여줌
    
//    var wifiStatusString: String {
//        get {
//            if wifiEnable {
//                return "On"
//            } else {
//                return "Off"
//            }
//        }
//    }
    
    // 위에 if문 요약
    var wifiStatusString: String { wifiEnable ? "On" : "Off" }
    
    var body: some View {
        VStack {
            Text("Wi-Fi Status")
            
            // 2. Toggle 스위치는 isOn에 이렇게 $를 붙여서 쓰면
            // Binding 해줌 -> 실제 wifiEnable 값이 바뀌도록 동기화 시킴
            Toggle(isOn: $wifiEnable) {
                Text("Enable Wi-Fi")
            }
            
            Text("\(wifiStatusString)")
        }
        .font(.largeTitle)
        .padding(60)
    }
}

struct WiFiView_Previews: PreviewProvider {
    static var previews: some View {
        WiFiView()
    }
}
