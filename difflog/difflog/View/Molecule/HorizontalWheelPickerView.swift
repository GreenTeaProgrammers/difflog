import SwiftUI
import SwiftUIWheelPicker
import ComposableArchitecture

struct HorizontalWheelPickerView: View {
    @Bindable var store: StoreOf<HorizontalWheelPickerReducer>
    
    @State var indexValue: Int = 0
    @State var currentSelected: String = ""
    @State var items: [Int] = []
    @State var itmesName: [String] = []
        
    var body: some View {
        VStack {
            Text("state: \(currentSelected)")
                .font(.title)
            Text("reducer: \(store.currentLocation)")
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
            itmesName = store.locations
            items = Array(0..<itmesName.count)
            currentSelected = itmesName[0]
            
        }
        .onChange(of: indexValue) { oldValue, newValue in
            currentSelected = itmesName[newValue]
            store.send(.updateCurrentLocation(currentSelected))
        }
        
    }
}

#Preview {
    HorizontalWheelPickerView(store:Store(initialState:HorizontalWheelPickerReducer.HorizontalWheelPickerState()){
        HorizontalWheelPickerReducer()
    })
        
}
