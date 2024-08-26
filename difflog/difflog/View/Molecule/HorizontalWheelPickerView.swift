import SwiftUI
import SwiftUIWheelPicker
import ComposableArchitecture

struct HorizontalWheelPickerView: View {
    @Bindable var store: StoreOf<HorizontalWheelPickerReducer>
    
    @State var indexValue: Int = 0
    @State var currentSelected: String = ""
    @State var items: [Int] = []

    @State var itmesName: [String] = ["zero", "one", "two", "three"]
        
    var body: some View {
        VStack {
            Text("Selected Value: \(currentSelected)")
                .font(.title)
            
            SwiftUIWheelPicker($indexValue, items: $items) { value in
                GeometryReader { reader in
                    Text("\(itmesName[value])")
                        .foregroundColor(value == indexValue ? .orange : .white)
                        .frame(width: reader.size.width, height: 20, alignment: .center)
                        .background(value == indexValue ? Color.white.opacity(0.1) : Color.clear )
                        .opacity(value == indexValue ? 1.0 : 0.5)
                        .cornerRadius(5)
                        
                }
            }
        }
        .onAppear {
            items = Array(0..<itmesName.count)
            currentSelected = itmesName[0]
            
        }
        .onChange(of: indexValue) { oldValue, newValue in
            currentSelected = itmesName[newValue]
        }
        
    }
}

#Preview {
    HorizontalWheelPickerView(store:Store(initialState:HorizontalWheelPickerReducer.HorizontalWheelPickerState()){
        HorizontalWheelPickerReducer()
    })
        
}
