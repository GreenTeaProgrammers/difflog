import SwiftUI

struct HomeMonthLabelView: View {
    let months = ["Jan.", "Feb.", "Mar.", "Apr.", "May.", "Jun.", "Jul.", "Aug.", "Sep.", "Oct.", "Nov.", "Dec."]
    
    var body: some View {
        VStack {
            ForEach(months.indices, id: \.self) { index in
                Text(months[index])
                    
                if index != months.indices.last {
                    Spacer(minLength: 26)  // ラベルの間にスペースを追加
                }
            }
        }
        .frame(maxHeight: .infinity)  // 縦方向に最大まで広げる
         
    }
}

#Preview {
    HomeMonthLabelView()
}
