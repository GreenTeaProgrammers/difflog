

import Foundation
import SwiftUI
import ComposableArchitecture

struct HomeView:View {
    var body: some View {
        VStack{
            Text("home")
            HorizontalWheelPickerView(store:Store(initialState:HorizontalWheelPickerReducer.HorizontalWheelPickerState()){
                HorizontalWheelPickerReducer()
            })
        }
        
    }
}
