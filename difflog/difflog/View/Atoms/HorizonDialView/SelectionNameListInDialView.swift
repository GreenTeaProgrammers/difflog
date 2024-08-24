//TODO: LocationListからNameを受け取って横に一覧にする
//TODO: どれか一つが必ず中央に行くように設定する

import Foundation
import SwiftUI

struct SelectionNameListInDialView:View {
    var selectionName: String
    var longestName:String
    
    var body: some View {
       
        Text(selectionName)
            .frame(maxWidth: CGFloat(longestName.count * 10), alignment: .center)
//            .background(Color.blue) // フレームに背景色を設定


    }
}

#Preview {
    SelectionNameListInDialView(selectionName: "tokyo",longestName: "tokyo")
}
