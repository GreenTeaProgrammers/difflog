import SwiftUI
import SwiftUIWheelPicker

struct HorizontalWheelPicker: View {
    
    
    
    @State var indexValue: Int = 5
    @State var items: [Int] = Array(0...10)
    
    var body: some View {
        VStack {
            Text("Selected Value: \(indexValue)")
                .font(.title)
            
            SwiftUIWheelPicker($indexValue, items: $items) { value in
                GeometryReader { reader in
                    Text("\(value)")
                        .frame(width: reader.size.width, height: 20, alignment: .center)
                        .background(value == indexValue ? Color.orange.opacity(1) : Color.clear)
                        .opacity(value == indexValue ? 1.0 : 0.5) // Alpha effect
                }
            }
        }
    }
}

#Preview {
    HorizontalWheelPicker()
}
