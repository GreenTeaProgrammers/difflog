import SwiftUI

struct ColoredBlockView: View {
    var insideOpacity: CGFloat
    var outsideOpacity: CGFloat
    var size: CGFloat
    var radius:CGFloat = 4
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.green.opacity(Double(outsideOpacity)))
                .border(Color.black)
                .frame(width: size, height: size)
                .cornerRadius(size/radius-1)
            Rectangle()
                .fill(Color.black)
                .frame(width: size*0.5, height: size*0.5)
                .cornerRadius(size/radius*0.5)

            Rectangle()
                .fill(Color.orange.opacity(Double(insideOpacity)))
                
                .frame(width: size*0.5, height: size*0.5)
                .cornerRadius(size/radius*0.5)
                
        }
        
    }
}

#Preview {
    ColoredBlockView(
        insideOpacity: 0.8,
        outsideOpacity: 0.8,
        size: 30
    )
}
