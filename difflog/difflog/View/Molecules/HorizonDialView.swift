//TODO: 横向きのダイアルの実装
//TODO: 
//TODO: 


import Foundation
import SwiftUI
import ComposableArchitecture

struct HorizonDialView:View{
    
    let store: StoreOf<HorizonDial>

    var body: some View{
        
        ZStack{
            SelectionScopeView(currentSelection: store.currentSelect)
            
            HStack{
                    ForEach(store.selectionNameList, id: \.self) { selectionName in
                        SelectionNameListInDialView(selectionName: selectionName,longestName: store.longestName)
                    }
            }
        }
    }
}

#Preview {
    HorizonDialView(
            store: Store(initialState: HorizonDial.HorizonDialState()) {
                HorizonDial()
            }
        )
}


