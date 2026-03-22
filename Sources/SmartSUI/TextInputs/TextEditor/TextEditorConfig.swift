import SwiftUI

public struct TextEditorConfig {
    let placeholder: String
    let maxLength: Int?
    let rules: [ValidationRule]
    let padding: Padding
    let colors: Colors
    let rounded: SmartRoundedStyleModifier.Rounded?
    let stroke: SmartStrokeStyleModifier.Stroke?
    let font: Font
    
    public init(placeholder: String = "placeholder",
                maxLength: Int? = nil,
                rules: [ValidationRule] = [],
                padding: Padding = .init(),
                colors: Colors = .init(),
                rounded: SmartRoundedStyleModifier.Rounded? = nil,
                stroke: SmartStrokeStyleModifier.Stroke? = nil,
                font: Font = .caption) {
        self.placeholder = placeholder
        self.maxLength = maxLength
        self.rules = rules
        self.padding = padding
        self.colors = colors
        self.rounded = rounded
        self.stroke = stroke
        self.font = font
    }
    
    public struct Padding {
        let textField: SmartPaddingStyleModifier.Padding
        let error: SmartPaddingStyleModifier.Padding
        
        public init(textField: SmartPaddingStyleModifier.Padding = .init(),
                    error: SmartPaddingStyleModifier.Padding = .init()) {
            self.textField = textField
            self.error = error
        }
    }
    
    public struct Colors {
        let text: Color
        let background: Color
        let border: Color
        let focused: Color
        let error: Color
        
        public init(text: Color = .black,
                    background: Color = .gray.opacity(0.5),
                    border: Color = .gray,
                    focused: Color = .accentColor,
                    error: Color = .red) {
            self.text = text
            self.background = background
            self.border = border
            self.focused = focused
            self.error = error
        }
    }
}
