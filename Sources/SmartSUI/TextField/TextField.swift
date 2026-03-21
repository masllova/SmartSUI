import SwiftUI

public struct SmartTextField: View {
    @Binding private var text: String
    @State private var isFocused = false
    @State private var error: String?
    private let config: TextFieldConfig
    
    public init(text: Binding<String>, config: TextFieldConfig) {
        self._text = text
        self.config = config
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            TextField(
                config.placeholder,
                text: $text,
                onEditingChanged: { focused in
                    isFocused = focused
                    validate()
                }
            )
            .font(config.font)
            .foregroundColor(config.colors.text)
            .onChange(of: text) { newValue in
                applyMaxLength()
                validate()
            }
            .smartPadding(config.padding)
            .smartRounded(config.rounded)
            .smartStroke(config.stroke, color: borderColor)
            
            if let error {
                Text(error)
                    .font(config.font)
                    .foregroundColor(config.colors.errorBorder)
            }
        }
    }
    
    private var borderColor: Color {
        if error != nil {
            return config.colors.errorBorder
        } else if isFocused {
            return config.colors.focusedBorder
        } else {
            return config.colors.border
        }
    }
    
    private func applyMaxLength() {
        guard let maxLength = config.maxLength else {
            return
        }
        if text.count > maxLength {
            text = String(text.prefix(maxLength))
        }
    }
    
    private func validate() {
        for rule in config.rules {
            switch rule.validate(text) {
            case .success:
                error = nil
            case .failure(let message):
                error = message
                return
            }
        }
    }
}
