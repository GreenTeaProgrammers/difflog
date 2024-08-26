import SwiftUI

struct HomeHeaderLabelView: View {
    @State var labelText: String

    var body: some View {
        Text(labelText)
            .font(.largeTitle) // 大きめの文字サイズ
            .bold() // 太字にする場合
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    HomeHeaderLabelView(labelText: "Welcome")
}
