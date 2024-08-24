//TODO: 丸かどの四角を作る、透明度を下げる
//TODO: Locationの文字が重なってる時currentSelectLocationを切り替える
import Foundation
import SwiftUI

struct SelectionScopeView: View {
    var currentSelection: String  // 引数として渡すテキスト
   

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.orange)
                .frame(width: CGFloat(currentSelection.count) * 10, height: 25)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 2)  // 黒い枠線
                )
                .padding()
        }
    }
}

#Preview {
    SelectionScopeView(currentSelection: "Your Text Here") //
}
