

import Foundation
import SwiftUI
import ComposableArchitecture

struct HomeView:View {
    
    var HomeHeaderLabel:String
    
    var body: some View {
        VStack{
            HomeHeaderLabelView(labelText: HomeHeaderLabel)
            HStack{
                HomeMonthLabelView()
                Blocks()
            }
            
            
            Spacer()
            HorizontalWheelPickerView(store:Store(initialState:HorizontalWheelPickerReducer.HorizontalWheelPickerState()){
                HorizontalWheelPickerReducer()
            })
            
            HorizontalWheelPickerView(store:Store(initialState:HorizontalWheelPickerReducer.HorizontalWheelPickerState()){
                HorizontalWheelPickerReducer()
            })
        }
       
        
    }
       
   }

