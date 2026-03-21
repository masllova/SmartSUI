import SwiftUI

public struct TextFieldConfig {
    var placeholder: String = "placeholder"
    var maxLength: Int? = nil
    var rules: [ValidationRule] = []
    var textColor: Color = .black
    var borderColor: Color = .gray
    var focusedBorderColor: Color = .accentColor
    var errorBorderColor: Color = .red
    var font: Font = .caption
}
