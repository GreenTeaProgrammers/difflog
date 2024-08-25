import SwiftUI
import UIKit

struct CameraModePickerView: UIViewRepresentable {
    let captureModesList = ["Default", "Sepia", "Warm", "Cool", "Vivid", "Noir"]
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPickerView {
        let pickerView = UIPickerView()
        pickerView.dataSource = context.coordinator
        pickerView.delegate = context.coordinator
        
        let rotationAngle: CGFloat = -90 * (.pi / 180)
        pickerView.transform = CGAffineTransform(rotationAngle: rotationAngle)
        pickerView.frame = CGRect(x: -150, y: 0.0, width: 300, height: 200)
        
        return pickerView
    }
    
    func updateUIView(_ uiView: UIPickerView, context: Context) {
        // 特に更新が必要な処理がない場合は何もしない
    }
    
    class Coordinator: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
        var parent: CameraModePickerView
        
        init(_ parent: CameraModePickerView) {
            self.parent = parent
        }
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return parent.captureModesList.count
        }
        
        func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            let modeView = UIView()
            modeView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            let modeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
            modeLabel.textColor = .yellow
            modeLabel.text = parent.captureModesList[row]
            modeLabel.textAlignment = .center
            modeView.addSubview(modeLabel)
            modeView.transform = CGAffineTransform(rotationAngle: 90 * (.pi / 180))
            return modeView
        }
        
        func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
            return 100
        }
    }
}

#Preview {
    CameraModePickerView()
        .preferredColorScheme(.dark)
}
