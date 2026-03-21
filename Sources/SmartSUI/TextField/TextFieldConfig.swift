import SwiftUI

public struct TextFieldConfig {
    let placeholder: String
    let maxLength: Int?
    let rules: [ValidationRule]
    let padding: Padding
    let colors: Colors
    let rounded: SmartRoundedStyleModifier.Rounded?
    let stroke: SmartStrokeStyleModifier.Stroke?
    let font: Font
    let icons: [Icon]
    
    public init(placeholder: String = "placeholder",
                maxLength: Int? = nil,
                rules: [ValidationRule] = [],
                padding: Padding = .init(),
                colors: Colors = .init(),
                rounded: SmartRoundedStyleModifier.Rounded? = nil,
                stroke: SmartStrokeStyleModifier.Stroke? = nil,
                font: Font = .caption,
                icons: [Icon] = []) {
        self.placeholder = placeholder
        self.maxLength = maxLength
        self.rules = rules
        self.padding = padding
        self.colors = colors
        self.rounded = rounded
        self.stroke = stroke
        self.font = font
        self.icons = icons
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
    
    public struct Icon: Identifiable {
        public let id = UUID().uuidString
        let icon: Image
        let size: Size
        let type: ViewType
        let location: Aligment
        let padding: SmartPaddingStyleModifier.Padding
        let action: Action?
        
        public init(icon: Image,
                    size: Size = .init(all: 8),
                    type: ViewType,
                    location: Aligment,
                    padding: SmartPaddingStyleModifier.Padding = .init(),
                    action: Action? = nil ) {
            self.icon = icon
            self.size = size
            self.type = type
            self.location = location
            self.padding = padding
            self.action = action
        }
        
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
        
        func isVisible(textIsEmpty: Bool) -> Bool {
            switch type {
            case .staticIcon:
                true
            case .visibleWithText:
                !textIsEmpty
            case .visibleWithoutText:
                textIsEmpty
            }
        }
    }
}
