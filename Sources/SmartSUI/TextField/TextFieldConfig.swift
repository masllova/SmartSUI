import SwiftUI

public struct TextFieldConfig {
    let placeholder: String
    let maxLength: Int?
    let rules: [ValidationRule]
    let textColor: Color
    let borderColor: Color
    let focusedBorderColor: Color
    let errorBorderColor: Color
    let font: Font
    
    public init(placeholder: String = "placeholder",
                maxLength: Int? = nil,
                rules: [ValidationRule] = [],
                textColor: Color = .black,
                borderColor: Color = .gray,
                focusedBorderColor: Color = .accentColor,
                errorBorderColor: Color = .red,
                font: Font = .caption) {
        self.placeholder = placeholder
        self.maxLength = maxLength
        self.rules = rules
        self.textColor = textColor
        self.borderColor = borderColor
        self.focusedBorderColor = focusedBorderColor
        self.errorBorderColor = errorBorderColor
        self.font = font
    }
}
