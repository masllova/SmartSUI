import SwiftUI

public struct SmartTextField: View {
    @Binding var text: String
    @State private var isFocused = false
    @State private var error: String?
    
    let config: TextFieldConfig
    
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
            .foregroundColor(config.textColor)
            .onChange(of: text) { newValue in
                applyMaxLength()
                validate()
            }
            .padding(12)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(borderColor, lineWidth: 1)
            )
            
            if let error {
                Text(error)
                    .font(config.font)
                    .foregroundColor(config.errorBorderColor)
            }
        }
    }
    
    private var borderColor: Color {
        if error != nil { return config.errorBorderColor }
        if isFocused { return config.focusedBorderColor }
        return config.borderColor
    }
    
    private func applyMaxLength() {
        guard let maxLength = config.maxLength else { return }
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
