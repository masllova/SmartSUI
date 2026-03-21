import SwiftUI

public struct TextFieldConfig {
    let placeholder: String
    let maxLength: Int?
    let rules: [ValidationRule]
    let padding: SmartPaddingStyleModifier.Padding
    let rounded: SmartRoundedStyleModifier.Rounded?
    let stroke: SmartStrokeStyleModifier.Stroke?
    let colors: Colors
    let font: Font
    let icons: [Icon]
    
    public init(placeholder: String = "placeholder",
                maxLength: Int? = nil,
                rules: [ValidationRule] = [],
                padding: SmartPaddingStyleModifier.Padding = .init(),
                rounded: SmartRoundedStyleModifier.Rounded? = nil,
                stroke: SmartStrokeStyleModifier.Stroke? = nil,
                colors: Colors = .init(),
                font: Font = .caption,
                icons: [Icon] = []) {
        self.placeholder = placeholder
        self.maxLength = maxLength
        self.rules = rules
        self.padding = padding
        self.rounded = rounded
        self.stroke = stroke
        self.colors = colors
        self.font = font
        self.icons = icons
    }
    
    public struct Colors {
        let text: Color
        let background: Color
        let border: Color
        let focusedBorder: Color
        let errorBorder: Color
        
        public init(text: Color = .black,
                    background: Color = .gray.opacity(0.5),
                    border: Color = .gray,
                    focusedBorder: Color = .accentColor,
                    errorBorder: Color = .red) {
            self.text = text
            self.background = background
            self.border = border
            self.focusedBorder = focusedBorder
            self.errorBorder = errorBorder
        }
    }
    
    public struct Icon {
        let icon: Image
        let padding: SmartPaddingStyleModifier.Padding
        let type: ViewType
        let location: Aligment
        let action: Action
        
        public enum ViewType {
            case staticIcon
            case visibleWithText
            case visibleWithoutText
        }
        
        public enum Aligment {
            case left
            case right
        }
        
        public enum Action {
            case clear
            case custom(() -> Void)
        }
    }
}
